db.pokemons.aggregate([
  {
     $match: {
        scores: { $exists: true }
     }
  },
  {
     $project: { 
        _id: false, nombre:true, scores:true
     }
  },
  {
    $limit: 1
  },
  {
    $project:{
       newScores:{
         $map: {
            input: '$scores',
            as: 'score',
            in:{
              $multiply: ['$$score', 5]
            }
         }
      }
    }
  }
])

// Todos los pokemon tipo fuego incrementan su poder por 3
db.pokemons.aggregate([
  {
    $match: {
      scores: { $exists: true },
   	  elemento: 'fuego'
    }
  },
  {
    $project: {
      _id: false,
      nombre: true,
      scores: true
    }
  },
  {
    $project: {
      nombre: true,
      newScores: {
        $map: {
          input: "$scores",
          as: "score",
          in: {
            $multiply: ["$$score", 3]
          }
        }
      }
    }
  }
])
 
//Uno a Uno
const user = {
   name: 'Jhon Doe',
   email: 'jhon@example.com',
   address: {
     city: 'PNA',
     postalCode: '543050',
     complement: 'Calle 5 No 123'
   }
}

//Una a Muchos
//Muchos a Muchos
const user = {
   name: 'Jhon Doe',
   email: 'jhon@example.com',
   address: [
   {
     city: 'PNA',
     postalCode: '543050',
     complement: 'Calle 5 No 123'
   },
   {
     city: 'CUCUTA',
     postalCode: '3050',
     complement: 'AV 0 11-11'
   },
   ]
}

// Cuando los datos no son cambiantes - sin tanta actualizacion
// Pocos atributos

const user = {
   name: 'Jhon Doe',
   email: 'jhon@example.com',
   address: [
    ObjectId('68479aae49af3fb892d796bc'),
    ObjectId('68479aae49af3fb892d796bc'),
    ObjectId('68479aae49af3fb892d796bc'),
   ]
}

// Una especie tiene muchos pokemons

const specie = {
   name: 'especie1',
   summary: 'descripcion de especie 1'
}

db.species.insertOne(specie)

ObjectId('685354918a83145b44abe9e8')


db.pokemons.updateOne(
{
   nombre: 'Pikachu'
},
{
  $set: {
    species_id: ObjectId('685354918a83145b44abe9e8')
  }
}
)

db.pokemons.updateOne(
{
   species_id: { $exists: false }
},
{
  $set: {
    species_id: ObjectId('685354918a83145b44abe9e8')
  }
}
)

db.pokemons.createIndex({
  elemento:1,
  species_id: 1
})

// simular los Join
db.pokemons.aggregate([
  {
    $lookup:{
        from: 'species',
        localField: 'species_id',
        foreignField: '_id',
        as: 'especies'    
    }
  },
    {
      $project: {
         _id: false, nombre: true, species_id: true, especies: true
      }
    },
])






























