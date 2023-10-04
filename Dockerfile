# syntax=docker/dockerfile:1.4

## Black Dahlia was here

####################################################################################################
## Create Your Directus Production Image

FROM directus/directus
USER root
RUN corepack enable \
  && chown node:node /directus

EXPOSE 8055

USER node
RUN npm install https://github.com/ilanur/directus-extension-customRetrieveItem && npm install https://github.com/ilanur/directus-extension-ai-operations
CMD : \
	&& node /directus/cli.js bootstrap \
	&& node /directus/cli.js start \
	;
