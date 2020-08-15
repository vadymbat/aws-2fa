FROM python:3.8-slim

ARG AWS_2FA_PATH='/usr/local/bin/aws2fa'

# install dependancies
RUN apt update && apt -y install bash-completion

# install requirements
COPY requirements.txt /tmp/pip-tmp/
RUN pip3 --disable-pip-version-check --no-cache-dir install -r /tmp/pip-tmp/requirements.txt \
   && rm -rf /tmp/pip-tmp

# activate autocomplete
RUN mkdir /etc/bash_completion.d && activate-global-python-argcomplete && \
   echo 'source /etc/profile.d/bash_completion.sh' > ~/.bashrc

COPY aws_2fa.py $AWS_2FA_PATH
RUN sed -i 's/\r$//g' $AWS_2FA_PATH && chmod +x $AWS_2FA_PATH

ENTRYPOINT [ "/bin/bash"]