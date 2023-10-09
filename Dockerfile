# syntax=docker/dockerfile:1.4

## Black Dahlia was here

####################################################################################################
## Create Your Directus Production Image

# syntax=docker/dockerfile:1.4
FROM directus/directus:10.6.3
USER root
RUN corepack enable \
&& corepack prepare pnpm@8.7.6 --activate \
&& chown node:node /directus
EXPOSE 8055
USER node
RUN pnpm install https://github.com/ilanur/directus-extension-customRetrieveItem && pnpm install https://github.com/ilanur/directus-extension-ai-operations
CMD : \
&& node /directus/cli.js bootstrap \
&& node /directus/cli.js start;
