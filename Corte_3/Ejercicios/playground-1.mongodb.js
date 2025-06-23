// MongoDB Playground
// Use Ctrl+Space inside a snippet or a string literal to trigger completions.

// The current database to use.
use("claseDos");


db.pokemons.find(
  {
    $and: [
      { games: { $exists: true }},
      { $where: 'this.games.length >= 5'}
    ]
  },
  {
    nombre: true,
    games: true
  }
)






// $where para expresiones pero solo para cuando el size no nos SVGComponentTransferFunctionElement

//Pokemones que tengan tres juegos
db.pokemons.find(
  {
    games: {
      $size: {
        $gt: 3
      }
    }
  },
  {
    nombre: true
  }
)





// Mostar
db.pokemons.findOne(
  {
     nombre: 'Pikachu'
  },
  {
    _id: false,
    nombre: true,
    games:{
      $slice: [3, 5]
    }
  }

)



//Todos los scores que sean 5 se convierten en 15
db.pokemons.updateMany(
  { 
    scores: { $exists: true },
    scores: 5

  }, 
   { 
    $set: { 
       'scores.$': 15
    } 
})



db.pokemons.updateOne(
  { 
    nombre: "Charizard"
   }, 
   { 
    $set: { 
       'games.1': 'Soulsilver'
    } 
})


db.pokemons.updateOne(
  { 
    nombre: "Charizard"
   }, 
   { 
    $pull: { 
       games: {
        $in: ['black', 'white']
      }
    } 
})




db.pokemons.updateOne(
  { 
    nombre: "Pikachu"
   }, 
   { 
    $pull: { 
       scores:'7'
    } 
})




db.pokemons.updateMany(
  { 
    nombre: "Pikachu"
   }, 
   { 
    $set: { 
       scores:['7']
    } 
})



db.pokemons.updateMany(
  { 
    nombre: "Pikachu"
   }, 
   { 
    $push: { 
       scores:{
        $each: [5,3,11,9],
        $sort: 1
       } 
    } 
})


db.pokemons.updateMany(
  { 
    nombre: "Pikachu"
   }, 
   { 
    $unset: { 
       scores:true 
    }
})




//Insertar un juego nuevo para bulbasur
db.pokemons.updateOne(
{
  nombre: 'Bulbasaur'
},
{
  $push:{
    games: 'Yellow'
  }
}
)


db.pokemons.updateOne(
{
  nombre: 'Charizard'
},
{
  $pop:{
    games: 2,
    }
}
)






/*db.pokemons.find({
  scores: 8
})*/


/*db.pokemons.updateMany(
  { 
     $and: [ 
       { nivelPoder:{ $gt: 70 }}, 
       { scores:{ $exists: false }} 
      ]
   }, 
   { 
    $set: { 
       scores: [7,8,9] 
    } 
})*/



/*db.pokemons.find({
  $and: [
    { games: 'Red'},
    { games: 'Ruby'},
  ]
})*/

/*db.pokemons.find({
  games: {
    $all: ['Red', 'Ruby']
  }
})*/

/*db.pokemons.find({
  games: 'Gold'
})


/*db.pokemons.updateMany(
  { 
     $and: [ 
       { nivelPoder:{ $lte: 70 }}, 
       { games:{ $exists: false }} 
      ]
   }, 
   { 
    $set: { 
       games: ["Silver", "Gold", "Blue"] 
    } 
})*/

/*db.pokemons.updateMany(
  {
      $and: [
         { nivelPoder: { $gt:70  } },
         { games:{ $exists: false }}
      ]
  },
  { $set:{
     games: ['Red','Ruby','Daimond']
  }
})*/




/* db.pokemons.findAndModify(
{
   query: { 
     nivel_poder: 70,
     nombre: { $exists: false }
   },
   update: { 
       $set:{
         nombre:"Pikachu",
         poder:"Impactrueno",
         elemento:"eléctrico",
         descripcion:"Un Pokémon eléctrico muy popular, conocido por su ternura y agilidad en combate.",
         altura_m:0.4,
         peso_kg:6.0
       }
   },
}
)

db.pokemons.findAndModify(
{
   query: { 
     nombre:"charmader", 
   },
   update: { 
       $set:{
         nivel_poder: 75,
         poder:"Impactrueno",
         elemento:"fuego",
         descripcion:"Un Pokémon eléctrico muy popular, conocido por su ternura y agilidad en combate.",
         altura_m:0.4,
         peso_kg:6.0
       }
   },
   new: true
}
)

//ALTER TABLE
// $rename

db.pokemons.updateMany(
  {},
  {
    $rename: {
      nivel_poder: 'nivelPoder'
    } 
  }

)
// Listas

db.pokemons.updateOne(
  { nombre: 'Bulbasaur' },
  {
    $set: {
      games: ['Silver', 'Gold', 'Blue']
    }
  }
)*/