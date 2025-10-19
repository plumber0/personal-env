# voice agent 네트워크 프로토콜 비교

선택지로는 SSE, WebSocket, WebRTC 가 있었고 voice chat 으로 WebRTC가 많이 언급 되었습니다.
ChatGPT voice, Grok companion, 영어 학습앱 Ameego 등 AI 기반 voice chat 앱들이 WebRTC를 사용하고 있었습니다.

SSE와 WebSocket 같은 경우는 전에 텍스트 기반 챗봇에서 사용해본 경험이 있었지만, WebRTC는 사용해본 적이 없어서 올바른 비교를 위해 WebRTC 스터디를 했습니다.

참고한 강의입니다. 링크() 
라이브러리나 프레임워크를 사용해서 단순히 클론앱을 구현하는 것이 아니라, 프로토콜의 핵심 구성요소와 signaling 과정을 자세하게 설명합니다. 
그리고 구현은 웹브라우저 console 상에서 직접 vanilla js만 사용해서 구현합니다. 강의 들으면서 정리한 노트는 다음과 같습니다.

학습을 하고 나서 비교를 하고 내린 결론은 선택할 수만 있다면 WebRTC를 선택하는 것이 좋다고 생각합니다.

- 장점
  - 가장 큰 이유는 Voice Agent에서 중요한 요소인 latency인데, TCP 기반 (SSE, WebSocket)보다 UDP 기반 (WebRTC)이 더 낮습니다.
    - 네트워크 상태에 따라 차이가 나겠지만, 일반적으로
    - WebRTC(<200ms) < WebSocket(200-500ms) < SSE(>500ms)
    - 순전히 네트워크 스택에 따라 발생하는 시간으로, llm agent 성능에 영향을 줄 수 있는 파이프라인 component에 더 투자를 할 수 있습니다.
  - 기본적으로 WebRTC는 미디어 스트리밍을 위해 설계되었기 때문에, 미디어 스트리밍에 최적화되어 있습니다. 브라우저나 모바일에 필요한 툴들이 이미 구현이 되어있습니다.
    - user의 디바이스 마이크, 카메라 접근, 음성 데이터 압축, packet timestamp 등
- 단점
  - 복잡도가 높습니다.
  - 추가로 신경 써야 하는 인프라 STUN, TURN 서버 등
  - Peer to Peer 구조로 디자인된 것이라, Client to Server로 사용할 경우 확장성이 떨어집니다.


# LiveKit

그래서 WebRTC 서버는 어떻게 만들지 하고 찾아보다가 알게 된 LiveKit입니다.
LiveKit은 WebRTC 서버 및 Voice Agent를 만들 수 있도록 도와주는 프레임워크입니다.

python, js, go 등등 다양한 언어로 SDK를 제공하고 있고, 단순히 SDK만 제공하는 것이 아니라 WebRTC를 전세계에 운영하기 위해 자체 네트워크 망을 가지고 있고, 클라우드로 운영하고 있습니다.
실제로 ChatGPT voice, Grok, Speak 등 굵직한 voice agent 서비스 공급자들이 LiveKit을 사용하고 있습니다.

마침 LiveKit도 Deeplearning.ai에서 강의를 제공하고 있어 확인해보았습니다. 
링크(https://learn.deeplearning.ai/courses/building-ai-voice-agents-for-production)
정리한 강의 노트()

중요 내용은 Speech-to-Speech 모델과 Pipeline 방식에 대한 비교, 그리고 컨트롤할 여지가 없는 엔드투엔드 모델보다 Pipeline 방식을 중점에 두고 설명합니다.
STT - LLM - TTS의 중요 요소들 말고도, VAD, EOU 등 Voice Agent에서 중요한 엔지니어링 요소들도 설명합니다.

VAD : 유저가 실제로 말하고 있는지 아닌지 판단하는 것 ( voice input, binary neural network)
EOU : 유저가 말을 실제로 마쳤는지 판단하는 것 ( transcript input, binary neural network)

voice detection, llm -> tts 스트리밍 구현, latency 최적화 등 제가 필요하다고 생각되는 요소들이 잘 구현되어 있는 것 같아서 LiveKit을 사용해보면 좋을 것 같습니다.



