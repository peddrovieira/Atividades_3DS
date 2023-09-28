SELECT * FROM Vagas
SELECT * FROM VagasConhecimentos where idVagas = 4

SELECT * FROM Candidato
SELECT * FROM Curriculo
SELECT * FROM CurriculoConhecimentos


DROP TABLE #TEMP_CANDIDATOS
DROP TABLE #TEMP_Aderencia

SELECT VC.idConhecimentos, 
       VC.idNivel, 
	   CC.idCurriculo, 
	   CASE
	        WHEN CC.idNivel >= VC.idNivel THEN 1
			ELSE                               0
	   END Aderencia
INTO #TEMP_CANDIDATOS
FROM VagasConhecimentos VC
INNER JOIN  CurriculoConhecimentos CC ON CC.idConhecimentos = VC.idConhecimentos
WHERE VC.idVagas = 4 --AND CC.idCurriculo IS NOT NULL

select * from #TEMP_CANDIDATOS

DECLARE @Conhecimentos FLOAT
SELECT @Conhecimentos = COUNT(*) FROM VagasConhecimentos VC WHERE VC.idVagas = 4

SELECT idCurriculo, (SUM(Aderencia)/@Conhecimentos)*100 Aderencia
INTO #TEMP_Aderencia
FROM #TEMP_CANDIDATOS
GROUP BY idCurriculo HAVING (SUM(Aderencia)/COUNT(*))*100 > 80

select * from #TEMP_Aderencia

INSERT
SELECT idCurriculo, Aderencia FROM  INTO #TEMP_Aderencia