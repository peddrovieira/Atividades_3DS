 NOME: Peddro Vieira Bonangelo
 RM:211047
 ATividade: TSQL_Exercício_01
 
 
 
 DECLARE @menorOder float,@maiorOrder float,@agentOrder float,@numOrder float;

 --Checar se n é igualdade no WHERE



 SELECT @menorOrder = MIN(ORD_AMOUNT)
	FROM Orders;

 SELECT @maiorOrder = MAX(ORD_AMOUNT) 
	FROM Orders;

SELECT @agentOrder = ORD_AMOUNT 
	FROM ORDERS
	WHERE AGENT_CODE = 'A004'


SELECT @numOrder = ORD_AMOUNT 
	FROM ORDERS
	WHERE ORD_NUM = 200116


IF @numOrder < @menorOder
BEGIN
	SELECT 'Order 200116 é a menor'
END

ELSE
BEGIN

	IF @numOrder > @maiorOrder
		BEGIN
			SELECT 'Order 200116 é a maior'
		END

	ELSE
		BEGIN
		
			IF @menorOder > @agentOrder  AND @agentOrder > @maiorOrder
				BEGIN
					SELECT 'Agente A004 está dentro do limite'
				END
		
			ELSE
				BEGIN

					IF @agentOrder > @numOrder
					BEGIN
						SELECT 'Agente A004 ultrapassou a venda alvo'
					END

					ELSE
					BEGIN
						SELECT 'Agente A004 não ultrapassou a venda alvo'
					END
				END
		END

END


