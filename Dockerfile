FROM node:12.9.0

WORKDIR /

ARG INPUT_JSON
ARG JIRA_USER
ARG JIRA_PASSWORD
ARG JIRA_PROJECT
ARG TOOL_NAME

ENV INPUT_JSON=$INPUT_JSON \
    JIRA_USER=$JIRA_USER \
    JIRA_PASSWORD=$JIRA_PASSWORD \ 
    JIRA_PROJECT=$JIRA_PROJECT \
    TOOL_NAME=$TOOL_NAME

COPY index.js package.json package-lock.json ./
COPY config/ ./config
COPY helpers/ ./helpers
COPY templates/ ./templates
COPY utils/ ./utils
COPY jsonParsers/ ./jsonParsers

RUN npm install

ENTRYPOINT ["node", "/index.js"]