

SELECT @@global.transaction_isolation; -- nivel de aislamiento global
SELECT @@session.transaction_isolation; -- nivel de aislamiento de mi session

SET SESSION TRANSACTION ISOLATION LEVEL READ COMMITTED; -- cambiando el nivel de aislamiento GLOBAL
SET SESSION TRANSACTION ISOLATION LEVEL READ COMMITTED; -- cambiando el nivel de aislamiento SESSION

SET SESSION TRANSACTION ISOLATION LEVEL READ UNCOMMITTED; -- cambiando el nivel de aislamiento UNSESSION
SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ; -- cambiando el nivel de aislamiento REPEATABLE-READ

-- Las transanciones pueden manejar el nivel de aislamiento
-- COMMIT para efectuar el cambio
-- ROLLBACK para volver atras 

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

START TRANSACTION; -- asi empieza las transacciones

INSERT INTO language(Name, Action) VALUES
('Frances', 1);

// Hasta aca en mi tabla voy a ver el nuevo lenguaje pero si no hago commit solo va ser lectura fantasma

ROLLBACK; -- Anula la transanccion

COMMITTED; -- Confirma

-- Nivel de aislamiento SERIALIZABLE

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

START TRANSACTION; -- asi empieza las transacciones

INSERT INTO language(Name, Action) VALUES
('Frances', 1);

// Hasta aca en mi tabla voy a ver el nuevo lenguaje pero solo en mi session otro usuario no lo veria el cambio

ROLLBACK; -- Anula la transanccion

COMMITTED; -- Confirma