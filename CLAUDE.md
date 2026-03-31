# CLAUDE.md

## Role

AI 네이티브 성장 워크스페이스의 협업 파트너. 학습 기록, 프로젝트 관리, 코드 작성을 함께 수행한다.

## 워크스페이스 개요

AI native 성장을 위한 학습/기록 공간.

- **기술 스택**: Kotlin, Spring Boot, AWS
- **언어**: 사용자와의 소통은 한국어로 진행. 코드/커밋 메시지/README는 영어 허용.
- **프로젝트 관리**: 각 프로젝트는 `projects/` 하위에 Git submodule로 관리

## 파일 구조 규칙

```
ai-workspace/
├── journal/     # 일지 (YYYY-MM-DD.md)
├── notes/       # 학습 노트, 로드맵, 액션 트래커
├── practices/   # AI 도구 활용 실습 코드
├── projects/    # 프로젝트 (Git submodule)
└── scripts/     # 유틸리티 셸 스크립트
```

- 새 파일은 반드시 위 디렉토리 중 하나에 배치. 루트에 파일 추가 금지 (CLAUDE.md, README.md, LICENSE 등 설정 파일 제외)
- 새 프로젝트 추가: `git submodule add <url> projects/<name>`
- 일지 파일명: `journal/YYYY-MM-DD.md`
- 노트 파일명: `notes/<topic>.md` (kebab-case)

## 일지 작성 규칙

```markdown
# YYYY-MM-DD (요일)

## 오늘 한 일
- 작업 항목 (구체적으로)

## 현재 진행 상황
- 로드맵 기준 현위치

## 다음 할 일
- [ ] 체크리스트 형태
```

- 당일 작업 내용만 기록. 추측이나 미래 계획은 "다음 할 일"에만 작성.
- 기술적으로 배운 것이 있으면 `## 배운 것` 섹션 추가 가능.

## 코딩 컨벤션

### 공통
- 파일 끝에 빈 줄 1개
- 마크다운: ATX 헤딩(`#`), 리스트는 `-` 사용
- 셸 스크립트: `set -euo pipefail`, shebang은 `#!/usr/bin/env bash`

### Kotlin
- 마켓플레이스 플러그인 `kotlin-conventions` 참조
- 설치: `bash projects/claude-marketplace/scripts/install-plugin.sh kotlin-conventions <project-path>`

## 검증 습관

- 코드 변경: 커밋 전 해당 테스트/빌드 실행
- 스크립트: 작성 후 간단한 케이스로 먼저 테스트
- Git 작업: 명령 전후로 상태 확인 (`git status`)
- 문서: 링크 유효성, 예제 코드 실행 여부 확인

## 노트 작성 규칙

`notes/` 디렉토리의 문서는 다음 구조를 따른다:

- 파일 상단에 제목(`#`)과 한 줄 설명 포함
- 섹션은 `##`로 구분, 깊이는 `###`까지만
- 로드맵/트래커 류 문서는 상단에 `> 마지막 업데이트: YYYY-MM-DD` 표기
- 체크리스트는 `- [ ]` / `- [x]` 형식 사용

## 금지 패턴

- **개인정보 노출 금지**: Git에 커밋되는 파일에 이직 계획, 타겟 회사명, 연봉 등 개인 커리어 정보를 포함하지 않는다.
- **빈 파일/디렉토리 생성 금지**: 내용 없는 placeholder 파일을 만들지 않는다.
- **루트 오염 금지**: 설정 파일 외 루트에 새 파일을 추가하지 않는다.
- **submodule 내부 수정 주의**: submodule 안의 변경은 해당 submodule에서 별도로 커밋/푸시해야 한다. 메인 워크스페이스에서는 참조만 업데이트한다.

## 커밋 컨벤션

- 형식: `<type>: <설명>` (한국어 또는 영어)
- type: `feat`, `fix`, `docs`, `chore`, `refactor`, `test`
- 본문은 선택사항. "왜"를 설명할 필요가 있을 때만 작성.

## 에러 핸들링 규칙

- 스크립트 실패 시: 원인 파악 → 최소 범위 수정 → 재실행. 무조건 재시도하지 않는다.
- submodule 충돌 시: 메인과 submodule 상태를 각각 확인 후 해결. `git checkout -- .`으로 날리지 않는다.
- 파일 손실 위험이 있는 git 명령(`reset --hard`, `clean -f`)은 사용자 확인 후 실행.
