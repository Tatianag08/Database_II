
-- ==============================
-- Caso 1: Registrar en log cada vez que se inserta un comentario
-- ==============================

-- Creamos una tabla de log para comentarios
CREATE TABLE IF NOT EXISTS comments_log (
    log_id SERIAL PRIMARY KEY,
    com_id INT,
    summary TEXT,
    date TIMESTAMP,
    tid INT,
    uid INT,
    action TEXT,
    log_date TIMESTAMP DEFAULT NOW()
);

-- Trigger function
CREATE OR REPLACE FUNCTION log_new_comment()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO comments_log (com_id, summary, date, tid, uid, action)
    VALUES (NEW.com_id, NEW.summary, NEW.date, NEW.tid, NEW.uid, 'INSERT');
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Trigger
DROP TRIGGER IF EXISTS trg_log_comment_insert ON comments;
CREATE TRIGGER trg_log_comment_insert
AFTER INSERT ON comments
FOR EACH ROW
EXECUTE FUNCTION log_new_comment();

-- ==============================
-- Caso 2: Validar que no se inserten tareas con fecha límite anterior a la fecha de creación
-- ==============================

-- Trigger function
CREATE OR REPLACE FUNCTION validate_task_dates()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.limit_date < NEW.created_date THEN
        RAISE EXCEPTION 'La fecha límite no puede ser anterior a la fecha de creación.';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Trigger
DROP TRIGGER IF EXISTS trg_validate_task_dates ON tasks;
CREATE TRIGGER trg_validate_task_dates
BEFORE INSERT ON tasks
FOR EACH ROW
EXECUTE FUNCTION validate_task_dates();

-- ==============================
-- Caso 3: Autoasignar prioridad 'media' (pid=8) si no se especifica en una nueva tarea
-- ==============================

-- Trigger function
CREATE OR REPLACE FUNCTION set_default_priority()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.pid IS NULL THEN
        NEW.pid := 8; -- prioridad media
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Trigger
DROP TRIGGER IF EXISTS trg_set_default_priority ON tasks;
CREATE TRIGGER trg_set_default_priority
BEFORE INSERT ON tasks
FOR EACH ROW
EXECUTE FUNCTION set_default_priority();
