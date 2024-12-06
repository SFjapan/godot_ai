godot v4.2.2とgodot rl agentを使った鬼ごっこ強化学習です。<br>
python側の設定はhttps://www.youtube.com/watch?v=f8arMv_rtUUこれを見てください。<br>
私はwindowsで実行し、エラーが出たのでコメント欄に記載されていた<br>
Lib\site-packages\godot_rl\wrappers\onnx\stable_baselines_export_py line 2 to `from gymnasium import spaces`.<br>
change line 11 to `from godot_rl.wrappers.onnx.stable_baselines_export import export_ppo_model_as_onnx`<br>
これをしました。
