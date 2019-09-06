#!/bin/bash
cd "$(dirname "$0")/.." || exit 1
exitCode=0
for file in devcontrol.sh bin/test.sh; do
    echo -n "Executing shellcheck over ${file}..."
    failed=0
    docker run -i --rm --workdir /workspace -v "$(pwd)":/workspace koalaman/shellcheck-alpine shellcheck -x "${file}" || failed=1
    if [ ${failed} -eq 0 ]; then
        echo "[OK]"
    else
        echo "-----> Test failed"
        exitCode=$((exitCode + 1))
    fi
done

exit ${exitCode}