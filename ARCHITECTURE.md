# 📐 System Architecture

RAgentic employs a **Sidecar Design Pattern** to separate application logic from security auditing.

## 🏗️ Technical Stack 

- **Base OS**: Alpine Linux (3.2x) via Node 22 parent image.
- **Runtime**: Node.js 22 LTS (Verified Digest).
- **Orchestration**: Docker Compose V2.
- **Security Engine**: Trivy (Aqua Security).
- **Verification**: Cosign (Sigstore).

## 🛡️ Hardening Measures

### 1. Immutable Infrastructure
The `Dockerfile` does not use mutable tags (e.g., `:latest`). It is pinned to a specific **SHA-256 Digest**:
`node@sha256:e4bf2a82ad0a4037d28035ae71529873c069b13eb0455466ae0bc13363826e34`

### 2. Privilege Restriction
The `docker-compose.yml` enforces `no-new-privileges:true`. This prevents the container process from gaining new privileges via `setuid` or `setgid` binaries, significantly mitigating potential exploitation impacts.

### 3. Sentinel Sidecar
The `security-sentinel` service runs as a neighbor to the application. It:
- Mounts the Docker socket in read-only mode (where possible).
- Uses a persistent cache volume (`trivy-cache`) for high-speed audits.
- Scans every 4 hours for newly announced Zero-Day vulnerabilities.
