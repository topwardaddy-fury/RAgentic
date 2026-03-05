# 🛡️ RAgentic: Self-Healing Container Security

RAgentic is an autonomous Security Engineering Agent designed to patch vulnerabilities while maintaining a strictly verified software supply chain. It operates on the principle of **"Never Trust, Always Verify."**

## 🚀 Quick Start (Docker Desktop)

Ensure Docker Desktop is running on your Mac, then execute:

```bash
# Build and launch the secured environment
docker-compose build && docker-compose up -d

# Verify the application is running
curl http://localhost:3333
```

## 🛠️ System Components

| Component | Purpose | File |
| :--- | :--- | :--- |
| **Verified Runtime** | Security-hardened Node.js 22 server. | [index.js](index.js) |
| **Security Sentinel** | Continuous vulnerability scanning sidecar. | [docker-compose.yml](docker-compose.yml) |
| **Watchdog Script** | Manual/On-demand desktop security audit. | [self_scan.sh](self_scan.sh) |
| **Immutable Build** | pinned SHA-256 digest for supply chain integrity. | [Dockerfile](Dockerfile) |

## 📚 Documentation index

- [**Architecture Overview**](ARCHITECTURE.md): Technical stack and design patterns.
- [**Security Protocol**](SECURITY_PROTOCOL.md): The "Identify, Source, Attest, Reason" workflow.
- [**Operations Guide**](OPERATIONS.md): Monitoring, logs, and port configuration.
