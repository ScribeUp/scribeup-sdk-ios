import os
from pathlib import Path

EXCLUDES = {
    "node_modules",
    "assets",
    "package-lock.json",
    "locale",
    "utility",
    "mydbengine",
    "LICENSE",
    "requirements",
    "directory_contents.txt",
    "Assets.xcassets",
}
EXCLUDE_FRAGMENTS = {"android", "ios"}  # anything containing these substrings


def print_directory_contents(path: str, file_handle, indent: str = "") -> None:
    """Recursively walk *path* and write a tree + file preview to *file_handle*."""
    for item in sorted(os.listdir(path)):
        print(f"{indent}|-- {item}")
        if (
            item.startswith(".")  # skip hidden
            or item in EXCLUDES
            or any(fragment in item for fragment in EXCLUDE_FRAGMENTS)
        ):
            continue

        item_path = os.path.join(path, item)
        file_handle.write(f"{indent}|-- {item}\n")

        if os.path.isdir(item_path):
            print_directory_contents(item_path, file_handle, indent + "    ")
        elif os.path.isfile(item_path):
            try:
                with open(item_path, encoding="utf-8") as f:
                    file_handle.write(f"{indent}    |-- Content:\n")
                    for line in f:
                        file_handle.write(f"{indent}    |   {line.rstrip()}\n")
            except Exception as exc:
                file_handle.write(f"{indent}    |-- Could not read file: {exc}\n")


def main(start_directory: str = ".") -> None:
    out_path = Path("directory_contents.txt")
    with out_path.open("w", encoding="utf-8") as out_file:
        print_directory_contents(start_directory, out_file)
    print(f"Directory tree written to {out_path.resolve()}")


if __name__ == "__main__":
    main()
