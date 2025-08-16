FROM docker.io/searxng/searxng:latest

# Set environment variables
ENV SEARXNG_SECRET_KEY=your-random-secret-key-here
ENV BIND_ADDRESS=0.0.0.0
ENV PORT=10000

# Expose port for Render
EXPOSE 10000

# Run SearxNG
CMD ["python", "searx/webapp.py"]
