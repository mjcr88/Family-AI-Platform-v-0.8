# Use a lightweight Python image
FROM python:3.11-slim

# Set the working directory
WORKDIR /app

# Install required Python packages
RUN pip install mcpo uv

# Command to run the MCP server via mcpo
CMD ["uvx", "mcpo", "--host", "0.0.0.0", "--port", "8000", "--", "uvx", "mcp-server-time", "--local-timezone=America/New_York"]