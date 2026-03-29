# AI Workspace

AI native로 성장하기 위한 학습 및 기록 워크스페이스

## 구조

```
ai-workspace/
├── notes/       # 학습 노트 및 개념 정리
├── practices/   # AI 도구 활용 실습 코드
├── projects/    # 프로젝트 (Git submodule)
└── journal/     # 일지/회고록
```

## 시작하기

```bash
# 전체 워크스페이스 클론 (submodule 포함)
git clone --recursive https://github.com/htcmw/ai-workspace.git

# 이미 클론한 경우 submodule 초기화
git submodule update --init --recursive
```

## 프로젝트 추가

```bash
# 새 프로젝트를 submodule로 추가
git submodule add <repo-url> projects/<project-name>
```

## 라이선스

MIT
