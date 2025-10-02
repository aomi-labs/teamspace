Oct 2, 2025

## aomi sync

Invited [Cecilia Zhang](mailto:cecilia@foameo.ai) [davidynamic@gmail.com](mailto:davidynamic@gmail.com) [windzhaohan@gmail.com](mailto:windzhaohan@gmail.com) [ksingh.consulting@gmail.com](mailto:ksingh.consulting@gmail.com)

Attachments [aomi sync](https://www.google.com/calendar/event?eid=NTdndDljbWdwNDBvcTd0NHUwaXRrNWFqY2pfMjAyNTEwMDFUMTUwMDAwWiBjZWNpbGlhQGZvYW1lby5haQ) 

Meeting records [Transcript](?tab=t.5ordofkp96nl) 

### Summary

David Thompson demonstrated their system for fetching, classifying, deciding, and executing contract information, discussing error handling and the challenge of forcing LLM errors for testing. Cecilia Zhang suggested that David Thompson's system was overly complicated, advising a simpler, more free-form approach for better performance and stressed the importance of directly interacting with the LLM. Kevin Singh demonstrated their system for contract discovery, compilation, deployment, and call execution, which uses AI to encode calls based on compiled ABI. HZ reported on the status of BMO integration, including the creation of a Pull Request for merging and the migration of work to a branch in the BMO repo. Cecilia Zhang emphasized the goal of transitioning the product model to be BAML-based, advocating for a stateless agent design where state serialization occurs via a BAML layer.

### Details

* **Meeting Agenda and Goal Setting** David Thompson highlighted the need for transparency in ongoing fixes within BAML and Kevin Singh's work to ensure seamless integration. Cecilia Zhang proposed starting with a demo of everyone's system capabilities, emphasizing interest in the functionality of each system ([00:00:00](?tab=t.5ordofkp96nl#heading=h.b8lsntrjxepi)).

* **David Thompson's System Demo \- Initial Run and Error Handling** David Thompson presented a demo of their system, showcasing its ability to fetch, classify, decide, and execute contract information, including error recovery and analysis of results ([00:00:58](?tab=t.5ordofkp96nl#heading=h.nhlovo7ky1bs)). They noted a recurring issue where the BAML server often fails on the first run but works correctly on subsequent attempts ([00:02:13](?tab=t.5ordofkp96nl#heading=h.7w3kzcccksth)). David Thompson also discussed the challenge of forcing the LLM to produce errors for testing recovery mechanisms, necessitating the mocking of errors by loading bad handler results ([00:05:05](?tab=t.5ordofkp96nl#heading=h.8yieq5hmzbd)).

* **Classification and LLM Context** Cecilia Zhang inquired about the purpose of classification in David Thompson's system, to which David Thompson explained that it helps the LLM by providing context on the contract type (e.g., proxy) before generating handler parameters ([00:05:05](?tab=t.5ordofkp96nl#heading=h.8yieq5hmzbd)). Cecilia Zhang suggested that pre-classification and fine-graining the LLM too much can lead to issues, proposing a more free-form approach for better performance, similar to how an agent would operate ([00:08:16](?tab=t.5ordofkp96nl#heading=h.hf5viw64wru6)).

* **Cecilia Zhang's Approach to LLM Interaction** Cecilia Zhang shared their successful approach to implementing discovery by having a very simple system that first feeds ABI data to the AI to generate call handlers. They explained that the AI then identifies gaps, such as the need for storage slot information, at which point source code is introduced in a second stage ([00:09:57](?tab=t.5ordofkp96nl#heading=h.nihivrfzmr4i)). Cecilia Zhang concluded that ABI often provides more precise answers than raw source code, and they emphasized the importance of iterative testing and observing the LLM's output in the BAML playground to refine the input and design ([00:11:49](?tab=t.5ordofkp96nl#heading=h.qwej0etzdibe)) ([00:19:25](?tab=t.5ordofkp96nl#heading=h.htg4dka24z6h)).

* **Discussion on BAML Playground Usage** Cecilia Zhang clarified that the BAML playground should be used for testing what information the LLM can retrieve, rather than for runner execution. David Thompson acknowledged that they had previously stopped using the playground based on Cecilia Zhang's earlier advice but confirmed they had continued to interact with the LLM directly through code. Cecilia Zhang stressed the importance of interacting directly with the LLM to understand what information is necessary and what it can process ([00:24:07](?tab=t.5ordofkp96nl#heading=h.o8yu53srioeo)) ([00:27:34](?tab=t.5ordofkp96nl#heading=h.3e01f5nxtehv)).

* **Critique of System Complexity and LLM Context** Cecilia Zhang asserted that David Thompson's system was overly complicated, suggesting that a more effective system should be simpler and allow the LLM to decide on its own without excessive pre-classification or forced behaviors ([00:29:56](?tab=t.5ordofkp96nl#heading=h.l5j8jeg9ucvh)). Cecilia Zhang advised against redundant code, such as creating new native types for contract info, and highlighted that the BAML backend handles output formatting, making explicit "return in the following format" statements in prompts unnecessary and confusing to the LLM ([00:32:42](?tab=t.5ordofkp96nl#heading=h.om92g2gs2obu)).

* **Kevin Singh's System Demo and Future Steps** Kevin Singh demonstrated their system, which performs contract discovery, compilation, deployment, and call execution based on user intent ([00:45:17](?tab=t.5ordofkp96nl#heading=h.5b691um83ho4)). The system currently focuses on simulation and doesn't generate code but uses AI to encode calls based on compiled ABI ([00:46:53](?tab=t.5ordofkp96nl#heading=h.b8mork1wem3i)). Cecilia Zhang noted that Kevin Singh's system is similar to the current product, which uses ABI for encoding and formatting transactions ([00:49:18](?tab=t.5ordofkp96nl#heading=h.kopji0o6o47f)). Cecilia Zhang advised Kevin Singh to test ideas by surrounding the LLM with relevant context, such as Solidity boilerplate code, to guide it toward generating actionable scripts rather than complicated setups ([00:50:13](?tab=t.5ordofkp96nl#heading=h.1frkpucdeq)).

* **Current BMO Integration Status** HZ reported that they created a Pull Request (PR) for merging and migrated work to a branch in the BMO repo for feedback ([00:57:18](?tab=t.5ordofkp96nl#heading=h.x56qwmfze9ya)). HZ also noted that the monorepo is still using the rig agent and lacks BMO integration, suggesting starting BMO integration in David or Kevin's codebase ([00:58:29](?tab=t.5ordofkp96nl#heading=h.qruz4uiyvla)). HZ confirmed that the generated types are mostly covered in integration tests and the Rust client and generator are working as expected for a beta version, with minor issues from upstream merging ([00:59:40](?tab=t.5ordofkp96nl#heading=h.z3kpju3kwcad)).

* **Transitioning to BAML-based Product Model** Cecilia Zhang expressed the goal of making the product model BAML-based. She emphasized the need for a subtle design approach to transition the existing agent, which currently maintains tool memory persistently, to a stateless agent model where state serialization occurs via a BAML layer ([01:03:39](?tab=t.5ordofkp96nl#heading=h.nzt1g3tkqfk)). Cecilia Zhang recommended that HZ investigate how the rig framework serializes tool information during RPC calls and translate that into a BAML structure ([01:05:58](?tab=t.5ordofkp96nl#heading=h.adbngrwatjjj)) ([01:11:43](?tab=t.5ordofkp96nl#heading=h.u5gcx7ae58ql)).

* **Stateless Agent Design and Tool Serialization** Cecilia Zhang elaborated on the stateless agent design, explaining that future agents should be stateless with all state managed externally within a session, akin to a thread pool ([01:07:27](?tab=t.5ordofkp96nl#heading=h.nug3tzi67irk)). She clarified that while the agent builder itself doesn't serialize tools during initialization, serialization occurs at runtime when the LLM generates a tool call, potentially folding all tools even if not immediately needed ([01:14:36](?tab=t.5ordofkp96nl#heading=h.e19dmy393c6g)). Cecilia Zhang advised HZ to document the current tool serialization process and plan the integration of BAML, aiming for a direct drop-in replacement without breaking existing functionality ([01:13:08](?tab=t.5ordofkp96nl#heading=h.xtzohmobp5et)) ([01:15:54](?tab=t.5ordofkp96nl#heading=h.fup9wcn2tod6)).

### Suggested next steps

- [ ] David Thompson will investigate the issue with the BAML server consistently failing on the first run.  
- [ ] Kevin Singh will figure out how Chisel works without specifying the compiler version to ensure only semantically useful information goes into the AI.  
- [ ] Kevin Singh will start with BAML unit tests for an ERC20 contract and a boilerplate script, then have the LLM generate a test script to execute user transfer requests, and try out Chisel to determine what runs, what doesn't, and what makes it run behind the scenes to inform the design of the BAML function.  
- [ ] The group will determine the minimal information the EVM needs and force the actual compilation to the backend.  
- [ ] Kevin Singh will import the logic from the script.  
- [ ] Kevin Singh will generate the script dynamically.  
- [ ] HZ will start to integrate the BMO into David or Kevin's code base.  
- [ ] HZ will figure out how rig translates tool information and how to convert it to BAML, then document everything before writing any code.

*You should review Gemini's notes to make sure they're accurate. [Get tips and learn how Gemini takes notes](https://support.google.com/meet/answer/14754931)*

*Please provide feedback about using Gemini to take notes in a [short survey.](https://google.qualtrics.com/jfe/form/SV_9vK3UZEaIQKKE7A?confid=yDTxlRZN3YvOPp9NKbT4DxIQOAIIigIgABgBCA&detailid=unspecified)*