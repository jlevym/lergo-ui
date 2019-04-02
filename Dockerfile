FROM lergo/lergo-build-setup:latest

ARG workdir=/app/lergo

WORKDIR ${workdir}

#lergo-ri and lergo-protractor-tests from github/jlevym

RUN git clone https://github.com/jlevym/lergo-ri.git
RUN git clone https://github.com/lergo/lergo-ui.git
# RUN git clone https://github.com/jlevym/lergo-protractor-tests.git

COPY scripts/install_ri.sh ${workdir}/lergo-build/scripts/install_ri.sh
RUN /bin/bash -c ${workdir}/lergo-build/scripts/install_ri.sh

COPY scripts/build_ri.sh ${workdir}/lergo-build/scripts/build_ri.sh
RUN /bin/bash -c ${workdir}/lergo-build/scripts/build_ri.sh

# COPY scripts/install_ui.sh ${workdir}/lergo-build/scripts/install_ui.sh
# RUN /bin/bash -c ${workdir}/lergo-build/scripts/install_ui.sh

# COPY scripts/build_ui.sh ${workdir}/lergo-build/scripts/build_ui.sh
# RUN /bin/bash -c ${workdir}/lergo-build/scripts/build_ui.sh

# COPY scripts/build_system_tests.sh ${workdir}/lergo-build/scripts/build_system_tests.sh
# RUN /bin/bash -c ${workdir}/lergo-build/scripts/build_system_tests.sh

COPY scripts/install_tasks.sh ${workdir}/lergo-build/scripts/install_tasks.sh
RUN /bin/bash -c ${workdir}/lergo-build/scripts/install_tasks.sh


# COPY scripts/upload_artifacts.sh ${workdir}/lergo-build/scripts/upload_artifacts.sh
# RUN /bin/bash -c ${workdir}/lergo-build/scripts/upload_artifacts.sh

# RUN /bin/bash -c 'source ~/.nvm/nvm.sh && cd lergo-ri && nvm use && ./node_modules/.bin/grunt testBefore'
# && source ~/.nvm/nvm.sh && nvm install && npm install"

# COPY scripts ${workdir}/lergo-build/scripts
# RUN bash -c /app/lergo/lergo-build/scripts/build_ri.sh
# RUN bash -c /app/lergo/lergo-build/scripts/build_ui.sh
# RUN bash -c /app/lergo/lergo-build/scripts/build_system_tests.sh
COPY . ${workdir}/lergo-build
