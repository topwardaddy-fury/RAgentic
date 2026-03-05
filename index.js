const http = require('http');

const server = http.createServer((req, res) => {
    res.writeHead(200, { 'Content-Type': 'text/plain' });
    res.end('RAgentic Security Verified Runtime Active.\nStatus: Healthy\nNode Version: ' + process.version + '\n');
});

const PORT = 3333;
server.listen(PORT, '0.0.0.0', () => {
    console.log(`🛡️ RAgentic Server running at http://0.0.0.0:${PORT}/`);
    console.log("Status: Healthy");
    console.log("Node Version:", process.version);
});
