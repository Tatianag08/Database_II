-- IMPRIMIR POR MEDIO DE UN CURSOR TODAS LAS TAREAS QUE TENGA PRIORIDAD BAJA HACER
-- UNA DE MODO IMPLICITO Y OTRA EXPLICITO DIGITANDO LA PRIORIDAD.

do
$$
DECLARE
    reg_task tasks%ROWTYPE;
    cur_task CURSOR FOR SELECT * FROM tasks WHERE pid = 3;
BEGIN
    RAISE NOTICE 'Starting explicit cursor processing for low priority tasks';
    FOR reg_task IN cur_task LOOP
        RAISE NOTICE 'Task: %, Priority: %', reg_task.title, reg_task.pid;
    END LOOP;
    RAISE NOTICE 'Explicit cursor processing completed';
END;
$$ LANGUAGE plpgsql;

do
$$
DECLARE
    reg_task tasks%ROWTYPE;
BEGIN
    RAISE NOTICE 'Starting implicit cursor processing for low priority tasks';
    FOR reg_task IN SELECT * FROM tasks WHERE pid = 3 LOOP
        RAISE NOTICE 'Task: %, Priority: %', reg_task.title, reg_task.pid;
    END LOOP;
    RAISE NOTICE 'Implicit cursor processing completed';
END;
$$ LANGUAGE plpgsql;

-- Cursor Implicito
do
$$
DECLARE
    reg_tasks tasks%ROWTYPE;
    cur_user CURSOR (level_task INT) FOR SELECT * FROM tasks WHERE pid = level_task;
    nivel INT := 2;
BEGIN
    RAISE NOTICE 'Starting cursor processing with parameter';
    FOR reg_tasks IN cur_user(nivel) LOOP
        RAISE NOTICE 'nombre tarea: %, Resumen: %', reg_tasks.title, reg_tasks.summary;
    END LOOP;
    RAISE NOTICE 'Cursor processing with parameter completed';
END;
$$ LANGUAGE plpgsql;