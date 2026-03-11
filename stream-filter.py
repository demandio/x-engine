#!/usr/bin/env python3
"""Filter Claude stream-json output into human-readable progress logs."""
import sys
import json

for line in sys.stdin:
    line = line.strip()
    if not line:
        continue
    try:
        event = json.loads(line)
    except json.JSONDecodeError:
        # Not JSON, print raw (stderr from claude, etc.)
        print(line)
        sys.stdout.flush()
        continue

    t = event.get("type", "")

    if t == "assistant":
        for block in event.get("message", {}).get("content", []):
            btype = block.get("type", "")
            if btype == "text" and block.get("text", "").strip():
                print(block["text"])
                sys.stdout.flush()
            elif btype == "tool_use":
                name = block.get("name", "")
                inp = block.get("input", {})
                if name == "Read":
                    print(f"  [READ] {inp.get('file_path', '')}")
                elif name == "Write":
                    print(f"  [WRITE] {inp.get('file_path', '')}")
                elif name == "Edit":
                    print(f"  [EDIT] {inp.get('file_path', '')}")
                elif name == "WebSearch":
                    print(f"  [SEARCH] {inp.get('query', '')}")
                elif name == "WebFetch":
                    print(f"  [FETCH] {inp.get('url', '')}")
                elif name == "Grep":
                    print(f"  [GREP] {inp.get('pattern', '')}")
                elif name == "Glob":
                    print(f"  [GLOB] {inp.get('pattern', '')}")
                elif name == "Bash":
                    print(f"  [BASH] {inp.get('command', '')[:120]}")
                else:
                    desc = str(inp)[:150]
                    print(f"  [{name}] {desc}")
                sys.stdout.flush()

    elif t == "result":
        result = event.get("result", "")
        if result:
            print(f"\n=== FINAL OUTPUT ===\n{result[:2000]}")
            sys.stdout.flush()
