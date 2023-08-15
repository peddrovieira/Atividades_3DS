DECLARE @numero1 float
	SELECT @numero1 = 1
DECLARE @numero2 float
	SELECT @numero2 = 2
DECLARE @numero3 float
	SELECT @numero3 = 3

DECLARE @numero4 float
	SELECT @numero4 = 4

DECLARE @operacao char(1)
	SELECT @operacao = '+'




	IF @operacao = '+'
	BEGIN
			SELECT @numero1 + @numero2 + @numero3 + @numero4
	END
	IF @operacao = '-'
	BEGIN
			SELECT @numero1 - @numero2 - @numero3 - @numero4
			
	END
	IF @operacao = '*' 
	BEGIN
			SELECT @numero1 * @numero2 * @numero3 * @numero4
	END


