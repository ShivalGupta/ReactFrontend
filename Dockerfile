FROM public.ecr.aws/docker/library/amazoncorretto:25-al2023
ENV HOME=/home/app
# Install Node.js
RUN dnf update -y && \
    dnf install -y curl && \
    curl -fsSL https://rpm.nodesource.com/setup_22.x | bash - && \
    dnf install -y nodejs
COPY package.json $HOME/node_docker/
WORKDIR $HOME/node_docker
RUN npm install --silent --progress=false
COPY . $HOME/node_docker
EXPOSE 3000
CMD ["npm", "start"]
