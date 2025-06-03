-- Cursores
-- Apuntadores solo lectura a un conjunto de datos - Por medio de una consulta
-- Resulset Recordset

-- Permiten procesar la información 1 a 1
-- Se declaran con una consulta con parametro o sin paramertos
-- Se debe usa un conjunto de comandos.

-- INSERT INTO users (name , email, register_date, country) VALUES
-- ('Juan Rodriguez', 'juan@example.com', NOW(), 'Colombia');

--do
--$$
--declare
  --reg_user users%ROWTYPE;
  --cur_user CURSOR FOR select * from users where country = 'Colombia';
--begin
  -- open cur_user;
	-- fetch cur_user into reg_user;
    -- raise notice 'el usuario es de %:',reg_user.uid;
    -- fetch cur_user into reg_user;
    -- raise notice 'el usuario es de %:',reg_user.uid;
   -- close cur_user;
--end; 
--$$ language plpgsql;

--DO
--$$
--declare
 -- reg_user users%ROWTYPE;
 -- cur_user CURSOR FOR select * from users where country = 'Colombia';
--begin
  -- open cur_user;
	-- fetch cur_user into reg_user;
     --while(FOUND) loop
		--raise notice 'el usuario es %',reg_user;
     --end loop;
   --close cur_user;
--end;
--$$ language plpgsql;

-- [<<Label>>]
-- FOR registro IN cursor1[(argumentos)] loop
-- comandos SQL
-- end Loop

--Implicitos = no declarar una variable row type
--Explicitos = Variable que almacena una consulta o mas

-- FOR
-- Explicito sin parametros
do
$$
declare
  reg_user users%ROWTYPE;
  cur_user CURSOR FOR select * from users where country = 'Colombia';
begin
   raise notice 'Inicio la iteración';
   for reg_user in cur_user loop
      raise notice 'Usuario es %', reg_user;
   end loop;
   raise notice 'FIn iteración';
end; 
$$ language plpgsql;

-- Implicito
do
$$
declare
  reg_user users%ROWTYPE;
begin
   raise notice 'Inicio la iteración';
   for reg_user in select * from users where country = 'Colombia' loop
      raise notice 'Usuario es %', reg_user;
   end loop;
   raise notice 'FIn iteración';
end; 
$$ language plpgsql


--Explicito con argumentos
do
$$
declare
  reg_user users%ROWTYPE;
  cur_user CURSOR(filtro varchar) FOR select * from users where country = filtro;
  filtro varchar := 'brASIL';
begin
   raise notice 'Inicio la iteración';
   for reg_user in cur_user(filtro) loop
     raise notice 'Usuario es %', reg_user;
   end loop;
end; 
$$ language plpgsql;


-- iMPRIMIR pOR  MEDIO DE UN CURSOR TODAS LAS TAREAS QUE TENGA PRIORIDAD BAJA HACER 
-- UNA DE MODO IMPLICITO Y OTRA EXPLICITO DIGITANDO LA PRIORIDAD.



