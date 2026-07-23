
DOMAIN =my.local.com
EMAIL4CERTS ?=internal

ENDPOINT ?=https://auth.${DOMAIN}
ADMIN_ENDPOINT ?=https://auth-admin.${DOMAIN}
APP_REAL_URL   ?=http://app.example.com

f ?=./docker-compose.yaml

start:
	DOMAIN=${DOMAIN} EMAIL4CERTS=${EMAIL4CERTS} ENDPOINT=${ENDPOINT} ADMIN_ENDPOINT=${ADMIN_ENDPOINT} APP_REAL_URL=${APP_REAL_URL} \
	docker-compose -f ${f} up -d ${services}
stop:
	docker-compose -f ${f} down ${services}

stop-with-clean:
	docker-compose -f ${f} down -v
