# Kali Linux Gemini CLI

This command launches the Gemini CLI in its specialized Interactive REPL mode and prepends your specific request as the first message of the conversation.
```
gemini-cli -- prompt-interactive "I'm conducting a penetration test on a web application. Help me identify potential vulnerabilities."
```

This command is a "Diagnostic Mode" prompt. It asks the AI for help with a specific task while simultaneously revealing exactly how the CLI is "thinking" and what files it is loading.

```
gemini-cli -- debug -- prompt "Help me troubleshoot this Nmap command"
```