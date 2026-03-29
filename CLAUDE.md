# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## 프로젝트 개요

AI native로 성장하기 위한 학습 및 기록 워크스페이스입니다.

## 디렉토리 구조

- `notes/` - 학습 노트 및 개념 정리
- `practices/` - AI 도구 활용 실습 코드
- `projects/` - 프로젝트 실험 및 프로토타입 (각 프로젝트는 Git submodule로 관리)
- `journal/` - 일지/회고록 (YYYY-MM-DD.md 형식)

## 프로젝트 관리 (Git Submodule)

새 프로젝트 추가:
```bash
# 1. 프로젝트 저장소 생성 후
git submodule add <repo-url> projects/<project-name>

# 또는 로컬에서 시작할 경우
cd projects && mkdir <project-name> && cd <project-name> && git init
# 이후 원격 저장소 연결하여 submodule로 등록
```

전체 워크스페이스 클론:
```bash
git clone --recursive <repo-url>
# 또는
git clone <repo-url> && git submodule update --init --recursive
```

서브모듈 업데이트:
```bash
git submodule update --remote --merge
```

## 작업 언어

사용자와의 소통은 한국어로 진행합니다.
