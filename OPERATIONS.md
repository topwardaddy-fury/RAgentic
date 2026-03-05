# ⚙️ Operations & Monitoring

## 📊 Monitoring Logs

To see the real-time security status of your RAgentic environment:

```bash
# View Application Logs
docker logs -f security_verified_ragentic

# View Security Sentinel Audit Logs
docker logs -f ragentic-sentinel
```

## 🔌 Port Configuration

The system is currently configured to listen on **Port 3333**.

- **Internal Container Port**: 3333
- **External Host Port**: 3333

To change the port, update the `ports` section in `docker-compose.yml` and the `PORT` constant in `index.js`.

## 🚨 Troubleshooting

### "Operation Not Permitted" (Docker Buildx)
If you encounter permission errors during build on Mac, the environment is configured to fallback to the legacy builder using:
`DOCKER_BUILDKIT=0 docker build -t ragentic-app:latest .`

### Scan Failures
If the `security-sentinel` reports a failure:
1. Check the image name in the log output.
2. Ensure the Docker daemon is accessible to the sidecar.
3. Review the reported CVEs in the Sentinel logs for manual intervention requirements.
