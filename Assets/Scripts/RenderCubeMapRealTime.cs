using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[ExecuteInEditMode]
public class RenderCubeMapRealTime : MonoBehaviour
{

    public Cubemap cubemap;
    public GameObject go;
    public void Update()
    {
        // create temporary camera for rendering
       // place it on the object
        go.GetComponent<Camera>().RenderToCubemap(cubemap);
        
    }
}
