# Disparadores (Triggers) en PostgreSQL

## ¿Qué son los disparadores?

Un **disparador** (trigger) es un mecanismo de la base de datos que permite ejecutar automáticamente una acción (generalmente una función) en respuesta a un evento en una tabla o vista, como una inserción (`INSERT`), modificación (`UPDATE`) o eliminación (`DELETE`).

Se utilizan para aplicar reglas de negocio automáticamente, mantener integridad, realizar auditorías, validar datos, entre otras cosas.


## ¿Para qué sirven los disparadores?

* **Auditoría de datos:** Registrar cambios automáticamente.
* **Validaciones:** Prevenir inserciones incorrectas.
* **Automatización:** Insertar registros relacionados.
* **Sincronización:** Copiar o replicar datos en otra tabla.

---

### Ventajas:

* Ejecutan reglas de negocio sin que el usuario tenga que preocuparse.
* Mejoran la seguridad y consistencia de los datos.
* Automatizan tareas repetitivas.

### Desventajas:

* Dificultan el seguimiento del flujo de ejecución (efectos ocultos).
* Pueden afectar el rendimiento si no se usan correctamente.
* Si tienen errores, pueden hacer fallar operaciones normales de la BD.

---

## Sintaxis básica de un disparador

```sql
CREATE [OR REPLACE] FUNCTION nombre_funcion() RETURNS TRIGGER AS $$
BEGIN
    -- Lógica del trigger
    RETURN NEW; -- o RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER nombre_trigger
{BEFORE | AFTER} {INSERT | UPDATE | DELETE}
ON nombre_tabla
FOR EACH ROW
EXECUTE FUNCTION nombre_funcion();
```

---

## ---  Casos de uso reales ---

### Caso 1: Auditoría de cambios de estado en tareas

**Problema:** No se llevaba registro de los cambios de estado de las tareas (de pendiente a completada, etc.).

**Solución:** Crear una tabla de auditoría y un disparador que guarde cada cambio de estado.

**Fragmento de código:**

```sql
CREATE TABLE tareas_auditoria (
    audit_id SERIAL PRIMARY KEY,
    tid INTEGER,
    old_status TEXT,
    new_status TEXT,
    modificado_en TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE OR REPLACE FUNCTION auditar_cambios_tarea() RETURNS TRIGGER AS $$
BEGIN
    IF OLD.status IS DISTINCT FROM NEW.status THEN
        INSERT INTO tareas_auditoria (tid, old_status, new_status)
        VALUES (OLD.tid, OLD.status, NEW.status);
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER tr_auditoria_tarea
AFTER UPDATE ON tasks
FOR EACH ROW
EXECUTE FUNCTION auditar_cambios_tarea();
```

---

### Caso 2: Evitar eliminación de tareas completadas

**Problema:** Se estaban eliminando tareas que ya habían sido completadas por error.

**Solución:** Crear un trigger que evite `DELETE` si la tarea tiene estado 'completado'.

**Fragmento de código:**

```sql
CREATE OR REPLACE FUNCTION evitar_eliminacion_completadas() RETURNS TRIGGER AS $$
BEGIN
    IF OLD.status = 'completado' THEN
        RAISE EXCEPTION 'No se pueden eliminar tareas completadas';
    END IF;
    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER tr_evitar_eliminar_tareas_completadas
BEFORE DELETE ON tasks
FOR EACH ROW
EXECUTE FUNCTION evitar_eliminacion_completadas();
```

---

### Caso 3: Insertar registro automático al crear una nueva tarea

**Problema:** Se quería generar automáticamente un comentario cuando se crea una nueva tarea.

**Solución:** Crear un trigger que inserte un comentario inicial en la tabla `comments` al insertar una nueva tarea.

**Fragmento de código:**

```sql
CREATE OR REPLACE FUNCTION crear_comentario_inicial() RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO comments (tid, uid, content, created_at)
    VALUES (NEW.tid, NEW.uid, 'Tarea creada automáticamente', NOW());
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER tr_comentario_inicial
AFTER INSERT ON tasks
FOR EACH ROW
EXECUTE FUNCTION crear_comentario_inicial();
```

---

## Conclusión

Los disparadores son una herramienta poderosa para mantener la integridad y automatizar procesos en una base de datos PostgreSQL. Aunque hay que usarlos con cuidado, pueden ser clave para sistemas como gestores de tareas, donde se requiere control, auditoría y automatización.

