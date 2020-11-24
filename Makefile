qe1:
	${QE_PATH} --enable-raw-queries -p 4466

qe2:
	${QE_PATH} --enable-raw-queries -p 5577

query1:
	curl 'http://localhost:4466/' --compressed -H 'content-type: application/json' --data-raw '{"operationName":null,"variables":{},"query":"mutation { executeRaw(query:\"SELECT pg_sleep(10);\") }"}'

query2:
	curl 'http://localhost:5577/' --compressed -H 'content-type: application/json' --data-raw '{"operationName":null,"variables":{},"query":"mutation { executeRaw(query:\"SELECT pg_sleep(10);\") }"}'

db:
	docker-compose up -d