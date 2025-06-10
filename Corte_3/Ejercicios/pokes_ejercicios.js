const pokes = [
  {nombre:"Pikachu",poder:"Impactrueno",elemento:"eléctrico",nivel_poder:85,descripcion:"Un Pokémon eléctrico muy popular, conocido por su ternura y agilidad en combate.",altura_m:0.4,peso_kg:6.0},
  {nombre:"Charizard",poder:"Llamarada",elemento:"fuego",nivel_poder:95,descripcion:"Dragón alado con un temperamento ardiente. Lanza fuego por su boca.",altura_m:1.7,peso_kg:90.5},
  {nombre:"Bulbasaur",poder:"Látigo Cepa",elemento:"planta",nivel_poder:70,descripcion:"Tiene una semilla en su espalda que crece a medida que lo hace.",altura_m:0.7,peso_kg:6.9},
  {nombre:"Squirtle",poder:"Pistola Agua",elemento:"agua",nivel_poder:72,descripcion:"Usa su caparazón como protección y lanza potentes chorros de agua.",altura_m:0.5,peso_kg:9.0},
  {nombre:"Jigglypuff",poder:"Canto",elemento:"hada",nivel_poder:60,descripcion:"Su canto hace dormir a sus oponentes. Tiene una voz dulce y peligrosa.",altura_m:0.5,peso_kg:5.5},
  {nombre:"Gengar",poder:"Bola Sombra",elemento:"fantasma",nivel_poder:88,descripcion:"Suele aparecer en la oscuridad. Se alimenta del miedo.",altura_m:1.5,peso_kg:40.5},
  {nombre:"Snorlax",poder:"Golpe Cuerpo",elemento:"normal",nivel_poder:90,descripcion:"Duerme la mayor parte del tiempo, pero es muy fuerte cuando se activa.",altura_m:2.1,peso_kg:460.0},
];


db.pokemons.find(
  { altura_m: { $gte: 0.5, $lte: 1.7 } },
  { nombre: true, poder: true, elemento: true, _id: false }
)


db.pokemons.find(
  { altura_m: { $gte: 0.5, $lte: 1.7 } },
  { _id: false, elemento: true }
)


db.pokemons.find(
  { altura_m: { $gte: 0.5, $lte: 1.7 } },
  { elemento: true, _id: false }
)


db.pokemons.find({$and: [
  { altura_m: {$lt :1}},
  { peso_kg: {$gt : 5}}
]
},{nombre:true, altura_m:true, peso_kg:true, _id:false})


db.pokemons.find(
  { 
     $or: [
      { nivel_poder: { $lt: 50 } }, 
      { elemento: "fuego" }
    ],
  { nombre: true, elemento: true, nivel_poder: true }
)

// Pokemon que terminen en D 'A%'
db.pokemons.find({
  nombre: /^S/
})

// que finalizan con ff '%A'
db.pokemons.find({
  nombre: /ff$/
})

// '%A%'
db.pokemons.find({
  nombre: /ba/
})

db.pokemons.find({
   $or:[
       { elemento: 'fuego' },
       { elemento: 'planta' },
       { elemento: 'agua'}
  ]
})

// IN => Between
db.pokemons.find({
   elemento: {
       $in: ['fuego', 'planta', 'agua']
   }
})

//NIN => $nin
db.pokemons.find({
   elemento: {
       $nin: ['fuego', 'planta', 'agua']
   }
})


const poke1 = { nombre:"mew", poder:"Telepatia",elemento:"Siquico",nivel_poder:90, vidas: 5},
db.pokemons.insertOne(poke1)


//exists

db.pokemons.find({
   vidas:{ 
     $exists: true
   }
})


const poke2 = { nombre:"psyduck", poder:"Telepatia",elemento:"Siquico",nivel_poder:90, fechanac: new Date()},
db.pokemons.insertOne(poke2)

$type

db.pokemons.find({
   fechanac:{
      $type: 'date'
   }
})


//Listar los pokemones que tenga altura y que sea mayor a 2
db.pokemons.find( { altura_m: {$gt: 2}}, {nombre:true, altura_m:true,_id:false})
db.pokemons.find({
   $and: [
       { altura_m: { $exists: true } }, 
       { altura_m: { $gte: 2 } }, 
   ]
   
}, { nombre:true, altura_m:true,_id:false })


Actualizar Documentos - UPDATES

const traerpoke = db.pokemons.findOne({ elemento: normal })
db.pokemons.save(traerpoke)

//UpdateOne
//UpdateMany

db.pokemons.updateOne(
  {
    //Filtro - Where
    elemento: 'normal'
  },
  {
    $set: {
       peso_kg: 46
    }
  }
)

// si tiene el atributo vidas coloquelo en cero

db.pokemones.updateOne(
   { vida: { $exists: true } },
   { $set: { vida: 0 } }
)

// si la altura es menor 0.5 sumele 0.1
// $inc $i += 0.1

db.pokemons.updateOne(
   { altura_m: { $lt: 0.5 } },
   { $inc : { altura_m: 0.1 } }
)


db.pokemons.upelementodateOne(
    {
      fechanac: { $exists: true }
    },
    {
       $unset:{
           fechanac: true,
       }
    }
)


db.pokemons.updateOne(
    {
      nombre: 'charmander'
    },
    {
      $set: {
         elemento: 'fuego'
      }
    },
    {
      upsert: true 
    }
)

// lanza vacio
db.pokemons.updateOne(
    {
      nombre: 'kakuna'
    },
    {
      $set: {
         nivel_poder: 10
      }
    }
)

const  temp = [ { name: 'user1' }, { name: 'user2' }]


CURSOR - find() - Cursor - Aplicar otros metodos que permiten recorrer la informar
findone() - Objeto

for(i=1; i<=50; i++){
  db.demos.insertOne({
     test: 'test'+i
  })
}












