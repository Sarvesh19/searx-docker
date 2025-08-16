FROM docker.io/searxng/searxng:latest

# Copy the settings file to the correct location
COPY searxng/settings.yml /etc/searxng/settings.yml

# Set proper ownership and permissions
USER root
RUN chown -R searxng:searxng /etc/searxng/ && \
    chmod 644 /etc/searxng/settings.yml
USER searxng

# Set environment variables
ENV SEARXNG_SECRET_KEY=your-random-secret-key-here
ENV BIND_ADDRESS=0.0.0.0
ENV PORT=10000

# Expose port for Render
EXPOSE 10000

# Run SearxNG
CMD ["python", "searx/webapp.py"]
