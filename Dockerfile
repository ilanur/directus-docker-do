# syntax=docker/dockerfile:1.4

## Black Dahlia was here

####################################################################################################
## Create Your Directus Production Image

FROM directus/directus
USER root
RUN corepack enable \
  && corepack prepare pnpm@8.7.6 --activate \
  # Currently required, we'll probably address this in the base image in future release
  && chown node:node /directus

EXPOSE 8055

USER node
RUN npm install directus-extension-field-actions && npm install https://github.com/ilanur/directus-extension-customRetrieveItem && npm install https://github.com/ilanur/directus-extension-ai-operations
CMD : \
	&& node /directus/cli.js bootstrap \
	&& node /directus/cli.js start \
	;
