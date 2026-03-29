# AI 네이티브 백엔드 개발자 로드맵

## Kotlin × Spring Boot × AWS 기반 | 6~12개월 성장 전략

> **목표**: AI 시스템을 설계·운영할 수 있는 백엔드 엔지니어
> **현재 위치**: Claude Code 워크플로우를 설계·실행할 수 있으나, 엣지케이스에서 실패하는 중간 단계
> **작성일**: 2026-03-29

---

## 1. 병목 진단 프레임워크

워크플로우 실패의 근본 원인 4가지 분류:

### 원인 A: 프롬프트 설계 문제

- **증상**: 같은 프롬프트인데 실행할 때마다 결과가 다름
- **디버깅**: temperature 0으로 5회 실행, 출력 분산 측정
- **해결**: XML 태그로 구조화, Few-shot 예시 3개(정상/엣지/실패) 포함

### 원인 B: 컨텍스트 윈도우 / 메모리 관리 문제

- **증상**: 워크플로우 후반에 앞선 지시사항을 잊음
- **디버깅**: 각 단계에서 "현재 목표와 제약조건을 요약해봐" 질문
- **해결**: 핵심 지시사항 상단/하단 양쪽 배치, 컨텍스트 컴팩션 패턴

### 원인 C: 에이전트 오케스트레이션 구조 문제

- **증상**: 개별 태스크 성공, 연결 시 실패
- **디버깅**: 각 단계 입력/출력 로그로 데이터 변질 지점 추적
- **해결**: JSON Schema로 태스크 간 인터페이스 명시, 단일 책임 에이전트 파이프라인

### 원인 D: 툴 호출 신뢰성 문제

- **증상**: 도구 호출 누락 또는 잘못된 파라미터
- **디버깅**: 도구 호출 로그에서 누락/파라미터 오류/결과 오해석 분류
- **해결**: 사용 조건·파라미터·반환값 명시, 자동 재시도 + fallback 설계

---

## 2. 단계별 스킬 업그레이드

### 1단계 (1~2개월): 워크플로우 안정화

**목표**: 10번 실행하면 10번 동일한 품질의 결과

- 프롬프트 엔지니어링 심화 (Role → Context → Task → Constraints → Format)
- CLAUDE.md를 "에이전트의 헌법"으로 재설계
- Graceful Fallback 패턴 (재시도 → 단순화 → 사람 위임)
- hooks 기반 자동 검증

**레퍼런스**: Anthropic Prompt Engineering Guide, Claude Code Best Practices

### 2단계 (3~4개월): Kotlin + Spring Boot + AI

**목표**: AI 기능을 백엔드 시스템으로 설계하는 엔지니어로 전환

- **Spring AI 1.0 GA**: ChatClient API, Advisor 패턴, 벡터 스토어 추상화
- **LangChain4j 1.0**: @AiService, @Tool 기반 에이전트 선언적 정의
- **RAG 파이프라인**: 문서 수집 → 임베딩/벡터 스토어 → 검색/리랭킹/생성
- **AWS Bedrock + Lambda + Kotlin**: 서버리스 AI 추론 파이프라인
- **테스트/모니터링**: Evaluation-Driven Testing, Golden Dataset, 토큰/지연/비용 대시보드

### 3단계 (5~6개월): 실전 포지셔닝

**목표**: 프로덕션 레벨 포트폴리오 + 기술 브랜딩

- 포트폴리오 프로젝트 완성 (아래 참조)
- 기술 블로그 월 2회 이상
- GitHub 프로필 정비 (영어 README, ADR, 이슈/PR 체계화)

---

## 3. 포트폴리오 프로젝트

### 프로젝트 0: Claude Code Plugin Marketplace ⭐ (기반 인프라)

- **목적**: agent, skill, command, rule 등 Claude Code 도구를 플러그인 단위로 모듈화·등록·검색·조합하는 개인 마켓플레이스
- **역할**: 모든 워크플로우의 기반 — 여기서 플러그인을 만들고, 각 프로젝트에서 가져다 쓰는 구조
- **핵심**: 플러그인 표준 포맷 정의, 버전 관리, 의존성 해결, 카테고리별 검색
- **어필**: AI 워크플로우를 엔지니어링 수준으로 모듈화·관리하는 설계력

### 프로젝트 1: AI 코드 리뷰 에이전트 파이프라인

- **스택**: Kotlin, Spring Boot, Spring AI, AWS Lambda, Bedrock, GitHub Webhooks, pgvector, Redis
- **핵심**: 대규모 diff 청킹, RAG 기반 팀 맞춤 리뷰, 피드백 루프, 할루시네이션 검증
- **어필**: 실패 관리 설계력 + 엔드투엔드 시스템

### 프로젝트 2: 멀티모달 고객 문의 자동 분류/응답 시스템

- **스택**: Kotlin, Spring Boot, LangChain4j, Bedrock Multimodal, Qdrant, WebFlux, Kafka
- **핵심**: 멀티모달 파이프라인, 신뢰도 기반 에스컬레이션, 비동기 트래픽 대응
- **어필**: AI + 사람 하이브리드 아키텍처

### 프로젝트 3: AI 기반 API 문서 자동 생성/동기화 에이전트

- **스택**: Kotlin, Spring Boot, Spring AI, Claude Code 훅, GitHub Actions, MinIO
- **핵심**: AST + LLM 코드 이해, 부분 업데이트 파이프라인, API 호출 검증
- **어필**: 팀 생산성 향상 도구 설계 (DevEx)

---

## 4. 이력서 키워드 전략

**포함**: Spring AI, LangChain4j, RAG Pipeline, Vector Database, AWS Bedrock, AI Agent Orchestration, Prompt Engineering, Evaluation-Driven Development

**제외**: "ChatGPT 활용", "AI 도구 사용 경험", "프롬프트 작성", "Copilot 사용"
