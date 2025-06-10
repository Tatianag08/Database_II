/*
# --- Bases de datos disponibles ---
show databases
admin     40.00 KiB
config    12.00 KiB
local     40.00 KiB
todolist  40.00 KiB

# --- Nombre de la BD activa ---
db.getName()
test

# --- Cambiar a la BD todolist ---
use todolist
switched to db todolist

# --- Documento de ejemplo para la colección users ---
var User = {
  name: "ana",
  email: "ana@email.com",
  register_date: "01/01/01",
  country: "Colombia"
}

db.users.insertOne(User)
{ acknowledged: true,
  insertedId: ObjectId("6840e9755299dcdbd7b257e1") }

db.users.find();
{
  _id: ObjectId("6840e9755299dcdbd7b257e1"),
  name: 'ana',
  email: 'ana@email.com',
  register_date: '01/01/01',
  country: 'Colombia'
}

# --- Más usuarios (se crean sin salida del shell) ---
var User1 = {
  name: "Pedro",
  email: "Pedro@email.com",
  register_date: "01/02/01",
  country: "Colombia"
}

var User2 = {
  name: "Maria",
  email: "Maria@email.com",
  register_date: "03/02/01",
  country: "Colombia"
}

var User3 = {
  name: "MariaNO",
  email: "MariaNO@email.com",
  register_date: "03/02/01",
  country: "Peru"
}

# --- Consultas de users ---
db.users.find({ country: "Colombia" });
{
  _id: ObjectId("6840e9755299dcdbd7b257e1"),
  name: 'ana',
  email: 'ana@email.com',
  register_date: '01/01/01',
  country: 'Colombia'
}

db.users.find({ country: "Colombia" },
              { _id: false, register_date: false });
{
  name: 'ana',
  email: 'ana@email.com',
  country: 'Colombia'
}

db.users.find({ country: { $ne: 'colombia' } });
{
  _id: ObjectId("6840e9755299dcdbd7b257e1"),
  name: 'ana',
  email: 'ana@email.com',
  register_date: '01/01/01',
  country: 'Colombia'
}

 --- Documento de ejemplo para la colección tasks ---
var Task = {
  tid:  "100",
  title: "xxxxxx",
  summary: "yyyyyy",
  create_date: "1/1/1",
  limit_date: "1/1/3000",
  uid: "110",
  pid: "112"
}

db.Tasks.insertOne(Task)
{ acknowledged: true,
  insertedId: ObjectId("6840ed785299dcdbd7b257e2") }

*/
