FROM docker.io/searxng/searxng:latest

# Create config directory
RUN mkdir -p /etc/searxng

# Create settings.yml with JSON format enabled
RUN echo 'search:' > /etc/searxng/settings.yml && \
    echo '  formats:' >> /etc/searxng/settings.yml && \
    echo '    - html' >> /etc/searxng/settings.yml && \
    echo '    - json' >> /etc/searxng/settings.yml && \
    echo 'general:' >> /etc/searxng/settings.yml && \
    echo '  instance_name: "My SearxNG"' >> /etc/searxng/settings.yml

# Environment variables
ENV SEARXNG_SECRET_KEY=your-random-secret-key-here
ENV BIND_ADDRESS=0.0.0.0
ENV PORT=10000

EXPOSE 10000
CMD ["python", "searx/webapp.py"]
