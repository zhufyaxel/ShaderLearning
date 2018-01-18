﻿Shader "Custom/DebugShader"
{
	
	SubShader
	{
		
		Pass
		{
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			
			#include "UnityCG.cginc"

			struct v2f
			{
				float4 pos : SV_POSITION;
				fixed4 color : COLOR0;
			};

			v2f vert (appdata_full v)
			{
				v2f o;
				o.pos = UnityObjectToClipPos(v.vertex);
				// for normal
				//o.color = fixed4 (v.normal * 0.5 + fixed3(0.5, 0.5, 0.5), 1.0);
				// for tangent
				//o.color = fixed4 (v.tangent * 0.5 + fixed3(0.5, 0.5, 0.5), 1.0);
				// for Texcoord0
				o.color = fixed4(v.texcoord1.xy, 0.0, 1.0); 
				return o;
			}
			
			fixed4 frag (v2f i) : SV_Target
			{
				return i.color;
			}
			ENDCG
		}
	}
}
