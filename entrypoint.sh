#!/bin/bash
waiting_time=30

# wait for MSSQL server to start
export STATUS=1
i=0

sleep $waiting_time
while [[ $STATUS -ne 0 ]] && [[ $i -lt $waiting_time ]];
do
	i=$i+1
	/opt/mssql-tools18/bin/sqlcmd -t 1 -U sa -P $MSSQL_SA_PASSWORD -C -Q "select 1" >> /dev/null
	STATUS=$?
done

if [ $STATUS -ne 0 ]; then 
	echo "======= Error: MSSQL SERVER took more than $waiting_time seconds to start up.  ========";
	exit 1
fi

echo "======= MSSQL SERVER STARTED ========"

/opt/mssql-tools18/bin/sqlcmd -S localhost -U sa -P Abcd1234 -C -Q "IF DB_ID('OOTDV1') IS NULL BEGIN RESTORE DATABASE [OOTDV1] FROM DISK = '/var/opt/mssql/backup/OOTD.bak' WITH MOVE 'OOTDV1' TO '/var/opt/mssql/data/OOTDV1.mdf', MOVE 'OOTDV1_log' TO '/var/opt/mssql/data/OOTDV1_log.ldf' END"

echo "======= MSSQL CONFIG COMPLETE ======="