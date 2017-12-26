FROM flevanti/docker_webserver_u16php71

RUN echo "mailhub=mailcatcher.local" >> /etc/ssmtp/ssmtp.conf
RUN echo "hostname=dummyhostname" >> /etc/ssmtp/ssmtp.conf
RUN echo "FromLineOverride=YES" >> /etc/ssmtp/ssmtp.conf
RUN echo "UseTLS=NO" >> /etc/ssmtp/ssmtp.conf
RUN echo "UseSTARTTLS=NO" >> /etc/ssmtp/ssmtp.conf


