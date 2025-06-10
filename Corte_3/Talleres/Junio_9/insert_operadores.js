
//  ------- COLECCIÓN: lógicos --------


var operadorAnd = {
  titulo: "$and",
  tipo: "Lógico",
  descripcion: "Se utiliza para combinar múltiples condiciones que deben cumplirse simultáneamente.",
  sintaxis: "{ $and: [ { campo1: condición1 }, { campo2: condición2 } ] }",
  ejemplo: "{ $and: [ { edad: { $gte: 25 } }, { estado: 'activo' } ] }"
};

var operadorOr = {
  titulo: "$or",
  tipo: "Lógico",
  descripcion: "Permite que se cumpla al menos una de varias condiciones especificadas.",
  sintaxis: "{ $or: [ { campo1: condición1 }, { campo2: condición2 } ] }",
  ejemplo: "{ $or: [ { departamento: 'Ventas' }, { salario: { $gt: 4000 } } ] }"
};

var operadorNot = {
  titulo: "$not",
  tipo: "Lógico",
  descripcion: "Invierte el resultado lógico de una expresión.",
  sintaxis: "{ campo: { $not: { <operador-de-comparación> } } }",
  ejemplo: "{ puntuacion: { $not: { $lte: 3 } } }"
};

var operadorNor = {
  titulo: "$nor",
  tipo: "Lógico",
  descripcion: "Devuelve los documentos que no coinciden con ninguna de las condiciones.",
  sintaxis: "{ $nor: [ { condición1 }, { condición2 } ] }",
  ejemplo: "{ $nor: [ { rol: 'admin' }, { acceso: false } ] }"
};

db.logicos.insertMany([
  operadorAnd,
  operadorOr,
  operadorNot,
  operadorNor
]);

// ------- COLECCIÓN: relacionales ---------

var operadorEq = {
  titulo: "$eq",
  tipo: "Relacional",
  descripcion: "Selecciona documentos donde el valor del campo sea exactamente igual al valor proporcionado.",
  sintaxis: "{ campo: { $eq: valor } }",
  ejemplo: "{ nivel: { $eq: 'avanzado' } }"
};

var operadorNe = {
  titulo: "$ne",
  tipo: "Relacional",
  descripcion: "Selecciona documentos donde el valor del campo es diferente al valor especificado.",
  sintaxis: "{ campo: { $ne: valor } }",
  ejemplo: "{ estado: { $ne: 'inactivo' } }"
};

var operadorGt = {
  titulo: "$gt",
  tipo: "Relacional",
  descripcion: "Encuentra documentos con valores mayores al especificado.",
  sintaxis: "{ campo: { $gt: valor } }",
  ejemplo: "{ stock: { $gt: 100 } }"
};

var operadorGte = {
  titulo: "$gte",
  tipo: "Relacional",
  descripcion: "Busca valores mayores o iguales al valor dado.",
  sintaxis: "{ campo: { $gte: valor } }",
  ejemplo: "{ experiencia: { $gte: 5 } }"
};

var operadorLt = {
  titulo: "$lt",
  tipo: "Relacional",
  descripcion: "Filtra documentos con valores menores que el indicado.",
  sintaxis: "{ campo: { $lt: valor } }",
  ejemplo: "{ horas: { $lt: 40 } }"
};

var operadorLte = {
  titulo: "$lte",
  tipo: "Relacional",
  descripcion: "Selecciona documentos con valores menores o iguales al dado.",
  sintaxis: "{ campo: { $lte: valor } }",
  ejemplo: "{ edad: { $lte: 21 } }"
};

var operadorIn = {
  titulo: "$in",
  tipo: "Relacional",
  descripcion: "Verifica si un campo tiene un valor que pertenece a una lista.",
  sintaxis: "{ campo: { $in: [valor1, valor2, ...] } }",
  ejemplo: "{ categoria: { $in: ['tecnología', 'hogar'] } }"
};

var operadorNin = {
  titulo: "$nin",
  tipo: "Relacional",
  descripcion: "Filtra valores que NO estén dentro del arreglo especificado.",
  sintaxis: "{ campo: { $nin: [valor1, valor2] } }",
  ejemplo: "{ rol: { $nin: ['visitante', 'bloqueado'] } }"
};

var operadorExists = {
  titulo: "$exists",
  tipo: "Relacional",
  descripcion: "Verifica si un campo existe en los documentos.",
  sintaxis: "{ campo: { $exists: true|false } }",
  ejemplo: "{ email: { $exists: true } }"
};

var operadorType = {
  titulo: "$type",
  tipo: "Relacional",
  descripcion: "Devuelve documentos cuyo campo es de un tipo BSON específico.",
  sintaxis: "{ campo: { $type: tipo } }",
  ejemplo: "{ fecha: { $type: 'date' } }"
};

db.relacionales.insertMany([
  operadorEq,
  operadorNe,
  operadorGt,
  operadorGte,
  operadorLt,
  operadorLte,
  operadorIn,
  operadorNin,
  operadorExists,
  operadorType
]);
