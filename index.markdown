---
# Feel free to add content and custom Front Matter to this file.
# To modify the layout, see https://jekyllrb.com/docs/themes/#overriding-theme-defaults
---
<div>
<div style="display: block; float:left; width:60%; padding-left: 15px;padding-right: 15px;" >
<img src="pictures/opener_left.png" width="auto" align="center"/>
<img src="pictures/opener_right_old.png" width="auto" align="center"/>
</div>
<div style="vertical-align:middle; padding-top: 20px; padding-bottom: 20px;" align="center">
<h2><p>Parts-based shape warping enables generalizing skills from a single demonstration to objects with unfamiliar shapes, by: </p>
  <p>1) Decomposing objects into their constituent semantic parts, </p>
  <p>2) Autonomously constructing an objective that aligns those parts during skill execution.</p>
</h2>
</div>
</div>

<p>
</p>

<style>
  /* Style the button that is used to open and close the collapsible content */
.collapsible {
  background-color: #eee;
  color: #444;
  cursor: pointer;
  padding: 18px;
  width: 100%;
  border: none;
  text-align: left;
  outline: none;
  font-size: 15px;
}

.content {
      padding: 0 18px;
      overflow: hidden;
      max-height: 0;
      transition: max-height 0.2s ease-out;
    }

/* Add a background color to the button if it is clicked on (add the .active class with JS), and when you move the mouse over it (hover) */
.active, .collapsible:hover {
  background-color: #ccc;
}

</style>
<div>
<button type="button" class="collapsible">Click for Interactive Visualization</button>

<iframe  class="content" src="https://rthomp17.github.io/test_dash_app_hosting/" width="100%" height="800px" style="zoom: 0.6;"> </iframe>


</div>
Using a decomposed object representation, parts-based shape warping generalizes a manipulation skill to a wide range of object geometries from very few training
examples.  Above: results on a simulated mug-on-rack task, with a subsample of tested mugs enlarged for comparison.


Successful skill adaptation requires the ability to both identify the features of a novel object that are salient for a given skill, and to successfully adapt that skill policy to the novel object using those features. How can we better represent and condition on objects' geometric features to enable skill transfer to a wider variety of objects?

![](pictures/whole_pipeline.png)

Motivated by examples of improved transfer from compositional modeling,we explore a method for improving transfer performance using decomposition ---representing objects as compositions of independent representations, rather than a single, monolithic representation. Rather than model each object monolithically, we instead model each object as reconstructed from models of its segmented constituent parts---for example, modeling a handle, body, lid, and spout, rather than a monolithic teapot. 

<div>
  <img src="pictures/reconstruction_comparison.png" width="45%" align="center" style="padding-right: 15px;"/>
  <img src="pictures/relevant_parts.jpg" width="52%" align="center"/>
</div>

This decomposition improves transfer in two ways; first, it disentangles the learned feature representation of different parts from the relationship between those parts, which enables more accurate shape reconstruction and feature identification. And second, it enables skill generalization to a wider range of objects by modeling the relationships between object parts independently, adapting effectively when those part relationships change. 

![](pictures/shape_reconstruction.gif)

This improves transfer over monolithic representations. Here are some specific examples of improvements: 

![](pictures/whole_fail.png)


On the real robot, We utilize existing segmentation and semantic feature models to extract segmented point cloud views of each part, from which we can infer each part’s shape and pose, as well as an estimated collision mesh for motion planning.

![](pictures/reconstruction_from_cam.png)

And demonstrate improvement over monolithic object modeling on three different tasks:

![](pictures/three_tasks.png)


We also show the ability to do cross object generalization, by generalizing the skill from teapots to watering cans that share the same semantic parts.

![](pictures/watering_can.png)

<script>

let coll = document.getElementsByClassName("collapsible");
              
for (let i = 0; i < coll.length; i++) {
  coll[i].addEventListener("click", function() {
    this.classList.toggle("active");
    let content = this.nextElementSibling;
    if (content.style.maxHeight) {
      content.style.maxHeight = null;
    } else {
      content.style.maxHeight = "800px";
    }
  });
}

</script>


