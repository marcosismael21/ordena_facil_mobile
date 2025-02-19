class Cliente {
  int? id;
  String nombres;
  String correo;
  String telefono;
  String usuario;
  String clave;
  bool estado;

  Cliente({
    this.id,
    required this.nombres,
    required this.correo,
    required this.telefono,
    required this.usuario,
    required this.clave,
    required this.estado,
  });

  factory Cliente.fromJson(Map<String, dynamic> json) => Cliente(
        id: json["id"],
        nombres: json["nombres"],
        correo: json["correo"],
        telefono: json["telefono"],
        usuario: json["usuario"],
        clave: json["clave"],
        estado: json["estado"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombres": nombres,
        "correo": correo,
        "telefono": telefono,
        "usuario": usuario,
        "clave": clave,
        "estado": estado,
      };
}