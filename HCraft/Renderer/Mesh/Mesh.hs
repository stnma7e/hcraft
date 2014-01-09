module HCraft.Renderer.Mesh.Mesh where

import Graphics.Rendering.OpenGL

-- |Represents an OpenGL mesh source
data MeshSource
  = MeshSource { msVertices :: [ GLfloat ]
               }
  deriving ( Eq, Ord, Show )

-- |Represent and OpenGL mesh description
data MeshDesc
  = MeshDesc { mdName   :: String
             , mdSource :: Either String MeshSource
             }
  deriving ( Eq, Ord, Show )

-- |OpenGL mesh
data MeshObject
  = MeshObject { moVAO :: VertexArrayObject
               , moVBO :: BufferObject
               , moLength :: GLsizei
               }
  deriving ( Eq, Ord, Show )

-- |List of builtin meshes
meshBuiltin :: [ MeshDesc ]
meshBuiltin
  = [ MeshDesc "chunk" (Right $ MeshSource
      [  0.1,  0.8,  0.8,  0.0,  0.0,  0.8,  0.0,  0.0
      ,  0.1,  0.1,  0.8,  0.0,  0.0,  0.8,  0.0,  0.8
      ,  0.8,  0.8,  0.8,  0.0,  0.0,  0.8,  0.8,  0.0
      ,  0.8,  0.8,  0.8,  0.0,  0.0,  0.8,  0.8,  0.0
      ,  0.1,  0.1,  0.8,  0.0,  0.0,  0.8,  0.0,  0.8
      ,  0.8,  0.1,  0.8,  0.0,  0.0,  0.8,  0.8,  0.8

      ,  0.1,  0.1,  0.1,  0.0,  0.0,  0.1,  0.0,  0.8
      ,  0.1,  0.8,  0.1,  0.0,  0.0,  0.1,  0.0,  0.0
      ,  0.8,  0.8,  0.1,  0.0,  0.0,  0.1,  0.8,  0.0
      ,  0.1,  0.1,  0.1,  0.0,  0.0,  0.1,  0.0,  0.8
      ,  0.8,  0.8,  0.1,  0.0,  0.0,  0.1,  0.8,  0.0
      ,  0.8,  0.1,  0.1,  0.0,  0.0,  0.1,  0.8,  0.8

      ,  0.8,  0.1,  0.8,  0.8,  0.0,  0.0,  0.0,  0.0
      ,  0.8,  0.1,  0.1,  0.8,  0.0,  0.0,  0.0,  0.8
      ,  0.8,  0.8,  0.8,  0.8,  0.0,  0.0,  0.8,  0.0
      ,  0.8,  0.8,  0.8,  0.8,  0.0,  0.0,  0.8,  0.0
      ,  0.8,  0.1,  0.1,  0.8,  0.0,  0.0,  0.0,  0.8
      ,  0.8,  0.8,  0.1,  0.8,  0.0,  0.0,  0.8,  0.8

      ,  0.1,  0.1,  0.1,  0.1,  0.0,  0.0,  0.0,  0.8
      ,  0.1,  0.1,  0.8,  0.1,  0.0,  0.0,  0.0,  0.0
      ,  0.1,  0.8,  0.8,  0.1,  0.0,  0.0,  0.8,  0.0
      ,  0.1,  0.1,  0.1,  0.1,  0.0,  0.0,  0.0,  0.8
      ,  0.1,  0.8,  0.8,  0.1,  0.0,  0.0,  0.8,  0.0
      ,  0.1,  0.8,  0.1,  0.1,  0.0,  0.0,  0.8,  0.8

      ,  0.1,  0.1,  0.8,  0.0,  0.1,  0.0,  0.0,  0.0
      ,  0.1,  0.1,  0.1,  0.0,  0.1,  0.0,  0.0,  0.8
      ,  0.8,  0.1,  0.8,  0.0,  0.1,  0.0,  0.8,  0.0
      ,  0.8,  0.1,  0.8,  0.0,  0.1,  0.0,  0.8,  0.0
      ,  0.1,  0.1,  0.1,  0.0,  0.1,  0.0,  0.0,  0.8
      ,  0.8,  0.1,  0.1,  0.0,  0.1,  0.0,  0.8,  0.8

      ,  0.1,  0.8,  0.1,  0.0,  0.8,  0.0,  0.0,  0.8
      ,  0.1,  0.8,  0.8,  0.0,  0.8,  0.0,  0.0,  0.0
      ,  0.8,  0.8,  0.8,  0.0,  0.8,  0.0,  0.8,  0.0
      ,  0.1,  0.8,  0.1,  0.0,  0.8,  0.0,  0.0,  0.8
      ,  0.8,  0.8,  0.8,  0.0,  0.8,  0.0,  0.8,  0.0
      ,  0.8,  0.8,  0.1,  0.0,  0.8,  0.0,  0.8,  0.8
      ])
    , MeshDesc "chunkOccluder" (Right $ MeshSource
      [  0.0,  1.0,  1.0,  0.0,  0.0,  1.0,  0.0,  0.0
      ,  0.0,  0.0,  1.0,  0.0,  0.0,  1.0,  0.0,  1.0
      ,  1.0,  1.0,  1.0,  0.0,  0.0,  1.0,  1.0,  0.0
      ,  1.0,  1.0,  1.0,  0.0,  0.0,  1.0,  1.0,  0.0
      ,  0.0,  0.0,  1.0,  0.0,  0.0,  1.0,  0.0,  1.0
      ,  1.0,  0.0,  1.0,  0.0,  0.0,  1.0,  1.0,  1.0

      ,  0.0,  0.0,  0.0,  0.0,  0.0,  0.0,  0.0,  1.0
      ,  0.0,  1.0,  0.0,  0.0,  0.0,  0.0,  0.0,  0.0
      ,  1.0,  1.0,  0.0,  0.0,  0.0,  0.0,  1.0,  0.0
      ,  0.0,  0.0,  0.0,  0.0,  0.0,  0.0,  0.0,  1.0
      ,  1.0,  1.0,  0.0,  0.0,  0.0,  0.0,  1.0,  0.0
      ,  1.0,  0.0,  0.0,  0.0,  0.0,  0.0,  1.0,  1.0

      ,  1.0,  0.0,  1.0,  1.0,  0.0,  0.0,  0.0,  0.0
      ,  1.0,  0.0,  0.0,  1.0,  0.0,  0.0,  0.0,  1.0
      ,  1.0,  1.0,  1.0,  1.0,  0.0,  0.0,  1.0,  0.0
      ,  1.0,  1.0,  1.0,  1.0,  0.0,  0.0,  1.0,  0.0
      ,  1.0,  0.0,  0.0,  1.0,  0.0,  0.0,  0.0,  1.0
      ,  1.0,  1.0,  0.0,  1.0,  0.0,  0.0,  1.0,  1.0

      ,  0.0,  0.0,  0.0,  0.0,  0.0,  0.0,  0.0,  1.0
      ,  0.0,  0.0,  1.0,  0.0,  0.0,  0.0,  0.0,  0.0
      ,  0.0,  1.0,  1.0,  0.0,  0.0,  0.0,  1.0,  0.0
      ,  0.0,  0.0,  0.0,  0.0,  0.0,  0.0,  0.0,  1.0
      ,  0.0,  1.0,  1.0,  0.0,  0.0,  0.0,  1.0,  0.0
      ,  0.0,  1.0,  0.0,  0.0,  0.0,  0.0,  1.0,  1.0

      ,  0.0,  0.0,  1.0,  0.0,  0.0,  0.0,  0.0,  0.0
      ,  0.0,  0.0,  0.0,  0.0,  0.0,  0.0,  0.0,  1.0
      ,  1.0,  0.0,  1.0,  0.0,  0.0,  0.0,  1.0,  0.0
      ,  1.0,  0.0,  1.0,  0.0,  0.0,  0.0,  1.0,  0.0
      ,  0.0,  0.0,  0.0,  0.0,  0.0,  0.0,  0.0,  1.0
      ,  1.0,  0.0,  0.0,  0.0,  0.0,  0.0,  1.0,  1.0

      ,  0.0,  1.0,  0.0,  0.0,  1.0,  0.0,  0.0,  1.0
      ,  0.0,  1.0,  1.0,  0.0,  1.0,  0.0,  0.0,  0.0
      ,  1.0,  1.0,  1.0,  0.0,  1.0,  0.0,  1.0,  0.0
      ,  0.0,  1.0,  0.0,  0.0,  1.0,  0.0,  0.0,  1.0
      ,  1.0,  1.0,  1.0,  0.0,  1.0,  0.0,  1.0,  0.0
      ,  1.0,  1.0,  0.0,  0.0,  1.0,  0.0,  1.0,  1.0
      ])
    , MeshDesc "skybox" (Right $ MeshSource
      [ -1.0,  1.0,  1.0,  0.0,  0.0,  1.0,  0.0,  0.0
      ,  1.0,  1.0,  1.0,  0.0,  0.0,  1.0,  1.0,  0.0
      , -1.0, -1.0,  1.0,  0.0,  0.0,  1.0,  0.0,  1.0
      ,  1.0,  1.0,  1.0,  0.0,  0.0,  1.0,  1.0,  0.0
      ,  1.0, -1.0,  1.0,  0.0,  0.0,  1.0,  1.0,  1.0
      , -1.0, -1.0,  1.0,  0.0,  0.0,  1.0,  0.0,  1.0

      , -1.0, -1.0, -1.0,  0.0,  0.0, -1.0,  0.0,  1.0
      ,  1.0,  1.0, -1.0,  0.0,  0.0, -1.0,  1.0,  0.0
      , -1.0,  1.0, -1.0,  0.0,  0.0, -1.0,  0.0,  0.0
      , -1.0, -1.0, -1.0,  0.0,  0.0, -1.0,  0.0,  1.0
      ,  1.0, -1.0, -1.0,  0.0,  0.0, -1.0,  1.0,  1.0
      ,  1.0,  1.0, -1.0,  0.0,  0.0, -1.0,  1.0,  0.0

      ,  1.0, -1.0,  1.0,  1.0,  0.0,  0.0,  0.0,  0.0
      ,  1.0,  1.0,  1.0,  1.0,  0.0,  0.0,  1.0,  0.0
      ,  1.0, -1.0, -1.0,  1.0,  0.0,  0.0,  0.0,  1.0
      ,  1.0,  1.0,  1.0,  1.0,  0.0,  0.0,  1.0,  0.0
      ,  1.0,  1.0, -1.0,  1.0,  0.0,  0.0,  1.0,  1.0
      ,  1.0, -1.0, -1.0,  1.0,  0.0,  0.0,  0.0,  1.0

      , -1.0, -1.0, -1.0, -1.0,  0.0,  0.0,  0.0,  1.0
      , -1.0,  1.0,  1.0, -1.0,  0.0,  0.0,  1.0,  0.0
      , -1.0, -1.0,  1.0, -1.0,  0.0,  0.0,  0.0,  0.0
      , -1.0, -1.0, -1.0, -1.0,  0.0,  0.0,  0.0,  1.0
      , -1.0,  1.0, -1.0, -1.0,  0.0,  0.0,  1.0,  1.0
      , -1.0,  1.0,  1.0, -1.0,  0.0,  0.0,  1.0,  0.0

      , -1.0, -1.0,  1.0,  0.0, -1.0,  0.0,  0.0,  0.0
      ,  1.0, -1.0,  1.0,  0.0, -1.0,  0.0,  1.0,  0.0
      , -1.0, -1.0, -1.0,  0.0, -1.0,  0.0,  0.0,  1.0
      ,  1.0, -1.0,  1.0,  0.0, -1.0,  0.0,  1.0,  0.0
      ,  1.0, -1.0, -1.0,  0.0, -1.0,  0.0,  1.0,  1.0
      , -1.0, -1.0, -1.0,  0.0, -1.0,  0.0,  0.0,  1.0

      , -1.0,  1.0, -1.0,  0.0,  1.0,  0.0,  0.0,  1.0
      ,  1.0,  1.0,  1.0,  0.0,  1.0,  0.0,  1.0,  0.0
      , -1.0,  1.0,  1.0,  0.0,  1.0,  0.0,  0.0,  0.0
      , -1.0,  1.0, -1.0,  0.0,  1.0,  0.0,  0.0,  1.0
      ,  1.0,  1.0, -1.0,  0.0,  1.0,  0.0,  1.0,  1.0
      ,  1.0,  1.0,  1.0,  0.0,  1.0,  0.0,  1.0,  0.0
      ])
    ]