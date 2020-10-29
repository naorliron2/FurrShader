Shader "Unlit/Fur"
{
	Properties
	{
		_MainTex("Texture", 2D) = "white" {}
		_Length("Fur Length",Range(0,1)) = 0.2
		_Diffuse("Diffuse value", Range(0, 1)) = 1
		_FurTex("Fur Texture", 2D) = "white"{}
		_Density("Density",Range(0,1)) = 0.2
		_Multiplier("Multiplier",Float) = 1
		_Rigidness("Rigidness",Range(0,1)) = 0.2
		_Smoothness("Smoothness",Float)  = 0
	}
		SubShader
		{
			Tags { "RenderType" = "Transparent" "IgnoreProjector" = "True" "Queue" = "Transparent"}
			ZWrite Off
			Blend SrcAlpha OneMinusSrcAlpha

			Pass
		{

			ZWrite On
			ColorMask 0
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			// make fog work
			#pragma multi_compile_fog

			#include "UnityCG.cginc"

			struct appdata
			{
				float4 vertex : POSITION;
			};

			struct v2f
			{
				UNITY_FOG_COORDS(1)
				float4 vertex : SV_POSITION;
			};



			v2f vert(appdata v)
			{
				v2f o;
				o.vertex = UnityObjectToClipPos(v.vertex);
				return o;
			}

			fixed4 frag(v2f i) : SV_Target
			{

			return 0;
		}
		ENDCG
	}
			Pass
			{
			Tags { "RenderType" = "Opaque"  "Queue" = "Geometry"}

				CGPROGRAM
				#include "UnityCG.cginc"
				#define FURSTEP 0.00
				#pragma vertex baseVert
				#pragma fragment baseFrag
				#include "Fur.cginc"
				ENDCG
			}
			Pass
			{
				CGPROGRAM
				#include "UnityCG.cginc"
				#define FURSTEP 0.05
				#pragma vertex furVert
				#pragma fragment furFrag
				#include "Fur.cginc"
				ENDCG
			}
			Pass
			{
				CGPROGRAM
				#include "UnityCG.cginc"
				#define FURSTEP 0.1
				#pragma vertex furVert
				#pragma fragment furFrag
				#include "Fur.cginc"
				ENDCG
			}
			Pass
			{
				CGPROGRAM
				#include "UnityCG.cginc"
				#define FURSTEP 0.15
				#pragma vertex furVert
				#pragma fragment furFrag
				#include "Fur.cginc"
				ENDCG
			}
			Pass
			{
				CGPROGRAM
				#include "UnityCG.cginc"
				#define FURSTEP 0.2
				#pragma vertex furVert
				#pragma fragment furFrag
				#include "Fur.cginc"
				ENDCG
			}
			Pass
			{
				CGPROGRAM
				#include "UnityCG.cginc"
				#define FURSTEP 0.3
				#pragma vertex furVert
				#pragma fragment furFrag
				#include "Fur.cginc"
				ENDCG
			}
			Pass
			{
				CGPROGRAM
				#include "UnityCG.cginc"
				#define FURSTEP 0.35
				#pragma vertex furVert
				#pragma fragment furFrag
				#include "Fur.cginc"
				ENDCG
			}
			Pass
			{
				CGPROGRAM
				#include "UnityCG.cginc"
				#define FURSTEP 0.40
				#pragma vertex furVert
				#pragma fragment furFrag
				#include "Fur.cginc"
				ENDCG
			}
				Pass
			{
				CGPROGRAM
				#include "UnityCG.cginc"
				#define FURSTEP 0.45
				#pragma vertex furVert
				#pragma fragment furFrag
				#include "Fur.cginc"
				ENDCG
			}
			Pass
			{
				CGPROGRAM
				#include "UnityCG.cginc"
				#define FURSTEP 0.5
				#pragma vertex furVert
				#pragma fragment furFrag
				#include "Fur.cginc"
				ENDCG
			}
				Pass
			{
				CGPROGRAM
				#include "UnityCG.cginc"
				#define FURSTEP 0.6
				#pragma vertex furVert
				#pragma fragment furFrag
				#include "Fur.cginc"
				ENDCG
			}
			Pass
			{
				CGPROGRAM
				#include "UnityCG.cginc"
				#define FURSTEP 0.65
				#pragma vertex furVert
				#pragma fragment furFrag
				#include "Fur.cginc"
				ENDCG
			}
				Pass
			{
				CGPROGRAM
				#include "UnityCG.cginc"
				#define FURSTEP 0.7
				#pragma vertex furVert
				#pragma fragment furFrag
				#include "Fur.cginc"
				ENDCG
			}
				Pass
			{
				CGPROGRAM
				#include "UnityCG.cginc"
				#define FURSTEP 0.75
				#pragma vertex furVert
				#pragma fragment furFrag
				#include "Fur.cginc"
				ENDCG
			}
				Pass
			{
				CGPROGRAM
				#include "UnityCG.cginc"
				#define FURSTEP 0.8
				#pragma vertex furVert
				#pragma fragment furFrag
				#include "Fur.cginc"
				ENDCG
			}
				Pass
			{
				CGPROGRAM
				#include "UnityCG.cginc"
				#define FURSTEP 0.85
				#pragma vertex furVert
				#pragma fragment furFrag
				#include "Fur.cginc"
				ENDCG
			}
				Pass
			{
				CGPROGRAM
				#include "UnityCG.cginc"
				#define FURSTEP 0.9
				#pragma vertex furVert
				#pragma fragment furFrag
				#include "Fur.cginc"
				ENDCG
			}
				Pass
			{
				CGPROGRAM
				#include "UnityCG.cginc"
				#define FURSTEP 0.95
				#pragma vertex furVert
				#pragma fragment furFrag
				#include "Fur.cginc"
				ENDCG
			}
		}
}
