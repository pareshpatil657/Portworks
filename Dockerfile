From ansiblesemaphore/semaphore

RUN git clone https://github.com/pareshpatil657/Portworks.git
COPY repo.sh /home/semaphore 
WORKDIR /home/semaphore
RUN ./repo.sh
