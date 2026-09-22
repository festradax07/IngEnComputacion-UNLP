from pathlib import Path
import shutil

Import("env")


def _copy_tree_by_ext(src_root: Path, dst_root: Path, extensions: tuple[str, ...]) -> int:
    if not src_root.exists():
        return 0

    copied = 0
    for src_file in src_root.rglob("*"):
        if not src_file.is_file():
            continue
        if src_file.suffix.lower() not in extensions:
            continue

        rel = src_file.relative_to(src_root)
        dst_file = dst_root / rel
        dst_file.parent.mkdir(parents=True, exist_ok=True)
        shutil.copy2(src_file, dst_file)
        copied += 1

    return copied


def copy_sources_for_proteus(source, target, env):
    build_dir = Path(env.subst("$BUILD_DIR"))
    project_src_dir = Path(env.subst("$PROJECT_SRC_DIR"))
    project_include_dir = Path(env.subst("$PROJECT_INCLUDE_DIR"))

    copied_src = _copy_tree_by_ext(
        project_src_dir,
        build_dir / "src",
        (".c", ".h", ".hpp", ".hh"),
    )

    copied_include = _copy_tree_by_ext(
        project_include_dir,
        build_dir / "include",
        (".h", ".hpp", ".hh"),
    )

    print(
        f"[proteus] copied {copied_src} source/header files to {build_dir / 'src'} "
        f"and {copied_include} headers to {build_dir / 'include'}"
    )


env.AddPostAction("$BUILD_DIR/${PROGNAME}.elf", copy_sources_for_proteus)
