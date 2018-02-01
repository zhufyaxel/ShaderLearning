// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "Custom/RenderTextureTest" {
	Properties {
		_Color ("Color", Color) = (1,1,1,1)
		_MainTex ("Albedo (RGB)", 2D) = "white" {}
	}
	SubShader {
		Tags { "RenderType"="Opaque" }
		Pass{
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			
			sampler2D _MainTex;
			float4 _MainTex_ST;
			
			#include "UnityCG.cginc"

			struct a2v {
				float4 vertex : POSITION;
				float4 texcoord : TEXCOORD0;
			};
			
			struct v2f {
				float4 pos : SV_POSITION;
				float4 uv : TEXCOORD0;
			};
			
			v2f vert(a2v v) {
				v2f o;
				o.pos = UnityObjectToClipPos(v.vertex);
				o.uv.xy = TRANSFORM_TEX(v.texcoord, _MainTex);
				
				// Mirror needs to filp x
				
				return o;
			}
			
			fixed4 frag(v2f i) : SV_Target {
				return tex2D(_MainTex, i.uv.xy);
			}
			ENDCG
			
		}
		
		
		
	}
	FallBack "Diffuse"
}
