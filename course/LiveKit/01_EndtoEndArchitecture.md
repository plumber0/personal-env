# Network


- IP, TCP, UDP, HTTP, WebSocket, WebRTC  

<img src="./images/03.png" alt="End to End Architecture" width="500"/>

- TCP
  - if packet are lost, TCP will retransmit them, agent continue to wait
  - large amount of packets are sent and received at the same time, so even if little bit of packets are lost, it has to wait for the retransmit to complete

- UDP
  - if packet are lost, UDP will not retransmit them, agent will not wait for the retransmit to complete
  - less overhead, faster than TCP
  - not reliable, but good for live streaming

- HTTP
  - Built on TCP
  - Stateless - every request and response is a new connection and independent (except SSE)
  - Hypertext transfer protocol - it was designed for transferring text  
  <img src="./images/04.png" alt="End to End Architecture" width="500"/>

- WebSocket
  - Pros
    - supports full-duplex, persistent connections
    - easy to use
  - Cons
    - Built on TCP
    - No special facilities for streaming audio data

- WebRTC
  - An open-source project enabling real-time communication (RTC) capabilities directly in web browsers and mobile applications.
  - Allow audio, video, and data sharing without the need for plugins or external software.
  - Utilizes getUserMedia() API to access device cameras and microphones.
  - Enables screen sharing through getDisplayMedia()
  - Uses RTCDataChannel for peer-to-peer data exchange

  - Pros
    - Supports full-duplex, persistent connections
    - Built on UDP
    - Designed for streaming audio and video
        - Congestion control
        - Data compression(automatically applied before sending)
        - Automatic packet timestamps
  - Cons
    - Complexity  
    <img src="./images/05.png" alt="End to End Architecture" width="500"/>
    - Scale (it's designed for peer to peer, not server to many clients)  
    <img src="./images/06.png" alt="End to End Architecture" width="500"/>
      - needed to deploy multiple servers to handle multiple clients

  - LiveKit Cloud offer private network for low latency and high throughput  
  <img src="./images/07.png" alt="End to End Architecture" width="500"/>


# Voice AI Agent Architecture

<img src="./images/08.png" alt="Voice AI Agent Architecture" width="500"/>


- Agent Turn Detection (TD)
  - heuristic way to detect when user is speaking and when agent can speak
  - VAD : is user actually speaking? by energy level of the audio
  - Semantic turn deteection : what user actually saying? by transcript of the audio  
  <img src="./images/09.png" alt="Voice AI Agent Architecture" width="500"/>

Not only for the turn detection for user speaking, but also for the turn detection for agent speaking  

whille agent is speaking and detect user is speaking and take it a interruption than all the inference at that time will be interrupted and flushed.  

<img src="./images/10.png" alt="Voice AI Agent Architecture" width="500"/>

# Optimizing for Latency

- VAD, STT layer  
<img src="./images/11.png" alt="Voice AI Agent Architecture" width="500"/>

- LLM layer  
<img src="./images/12.png" alt="Voice AI Agent Architecture" width="500"/>

- TTS layer  
<img src="./images/13.png" alt="Voice AI Agent Architecture" width="500"/>

  