
// CONSULTAS SOBRE LA BASE 'operadores'
// Colecciones: logicos y relacionales
// ---------------------------------------------
// 📌 LÓGICOS

// 1. Obtener todos los operadores lógicos
db.logicos.find({});

// 2. Buscar operador lógico por título exacto
db.logicos.find({ titulo: "$nor" });

// 3. Operadores lógicos cuya descripción mencione 'documentos'
db.logicos.find({ descripcion: /documentos/ });

// 4. Proyección: mostrar solo título y tipo (sin _id)
db.logicos.find({}, { titulo: 1, tipo: 1, _id: 0 });

// 5. Operadores lógicos cuyo título contenga una letra 'o'
db.logicos.find({ titulo: /o/ });

// 6. Contar operadores lógicos registrados
db.logicos.countDocuments({});

// ---------------------------------------------

// 📌 RELACIONALES

// 1. Obtener todos los operadores relacionales
db.relacionales.find({});

// 2. Buscar operador relacional por título
db.relacionales.find({ titulo: "$gte" });

// 3. Buscar operadores relacionales cuya descripción hable de 'valores'
db.relacionales.find({ descripcion: /valores/ });

// 4. Mostrar solo los campos título y tipo
db.relacionales.find({}, { titulo: 1, tipo: 1, _id: 0 });

// 5. Buscar operadores relacionales cuyo título termine en "e"
db.relacionales.find({ titulo: /e$/ });

// 6. Contar documentos en la colección relacionales
db.relacionales.countDocuments({});
