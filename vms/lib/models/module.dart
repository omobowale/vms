class Module {
  final String id;
  final String moduleIconPath;
  final String moduleName;
  final Function onTap;

  const Module({
    required this.id,
    required this.onTap,
    required this.moduleName,
    required this.moduleIconPath,
  });
}
